import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/auth_firebase.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/data/model/inbox_request.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/data/specialist_inbox_repository.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

class SpecialistInboxRepositoryImpl implements SpecialistInboxRepository {
  SpecialistInboxRepositoryImpl({Database? database, AuthFirebase? auth})
    : _database = database ?? FirestoreDatabase(),
      _auth = auth ?? AuthFirebase();

  final Database _database;
  final AuthFirebase _auth;

  static const String _bookingsCollection = 'bookings';
  static const String _usersCollection = 'users';

  // Client display names are looked up per booking; cache them by userId so
  // the lookups don't repeat on every stream emission.
  final Map<String, String> _clientNameCache = {};
  String? _specialization;

  @override
  Stream<Either<Failure, List<InboxRequest>>> watchRequests() {
    final specialistId = _auth.currentUser?.uid;
    if (specialistId == null) {
      return Stream.value(const Right(<InboxRequest>[]));
    }

    return _database
        .streamCollectionWhere(
          path: _bookingsCollection,
          filters: {'specialistId': specialistId},
        )
        .asyncMap<Either<Failure, List<InboxRequest>>>((rows) async {
          try {
            final bookings =
                rows
                    .map((row) {
                      return BookModel.fromMap(
                        row,
                        id: row['id'] as String? ?? '',
                      );
                    })
                    // Completed and cancelled bookings never reach the inbox.
                    .where((booking) => booking.status.isActive)
                    .toList()
                  ..sort(
                    (a, b) => a.appointmentDate.compareTo(b.appointmentDate),
                  );

            final service = await _specializationOf(specialistId);
            final requests = <InboxRequest>[];
            for (final booking in bookings) {
              requests.add(
                InboxRequest(
                  id: booking.id,
                  clientName: await _clientNameOf(booking.userId),
                  service: service,
                  appointmentDate: booking.appointmentDate,
                  address: booking.address,
                  status: booking.status,
                ),
              );
            }
            return Right(requests);
          } on FirebaseException catch (e, stackTrace) {
            AppLogger.error(
              'SpecialistInboxRepository.watchRequests',
              e,
              code: e.code,
              stackTrace: stackTrace,
            );
            return Left(FirestoreFailure.fromException(e));
          } catch (e, stackTrace) {
            AppLogger.error(
              'SpecialistInboxRepository.watchRequests',
              e,
              stackTrace: stackTrace,
            );
            return Left(UnknownFailure(message: e.toString()));
          }
        });
  }

  @override
  Future<Either<Failure, void>> updateStatus(
    String bookingId,
    BookingStatus status,
  ) async {
    try {
      await _database.updateData(
        path: _bookingsCollection,
        documentId: bookingId,
        data: {'status': status.name},
      );
      return const Right(null);
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistInboxRepository.updateStatus',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistInboxRepository.updateStatus',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistInboxRepository.updateStatus',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  // The specialist's own specialization, shown as the service line on each
  // card. Read once, then served from cache.
  Future<String> _specializationOf(String specialistId) async {
    final cached = _specialization;
    if (cached != null) return cached;
    final data = await _database.readData(
      path: _usersCollection,
      documentId: specialistId,
    );
    final value = (data?['specialization'] as String?) ?? '';
    _specialization = value;
    return value;
  }

  Future<String> _clientNameOf(String userId) async {
    final cached = _clientNameCache[userId];
    if (cached != null) return cached;
    final data = await _database.readData(
      path: _usersCollection,
      documentId: userId,
    );
    final name = (data?['name'] as String?) ?? '';
    _clientNameCache[userId] = name;
    return name;
  }
}
