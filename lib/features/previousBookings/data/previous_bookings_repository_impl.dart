import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';
import 'package:thiquat_al_iklim/features/previousBookings/data/model/booking_with_specialist.dart';
import 'package:thiquat_al_iklim/features/previousBookings/data/previous_bookings_repository.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class PreviousBookingsRepositoryImpl implements PreviousBookingsRepository {
  PreviousBookingsRepositoryImpl({Database? database})
    : _database = database ?? FirestoreDatabase();

  final Database _database;

  static const String _bookingsCollection = 'bookings';
  static const String _usersCollection = 'users';

  @override
  Future<Either<Failure, List<BookingWithSpecialist>>> getUserBookings(
    String userId,
  ) async {
    try {
      final bookingDocs = await _database.readCollectionWhere(
        path: _bookingsCollection,
        filters: {'userId': userId},
      );
      final bookings = bookingDocs.map(BookModel.fromMap).toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      final results = <BookingWithSpecialist>[];
      for (final booking in bookings) {
        final specialistData = await _database.readData(
          path: _usersCollection,
          documentId: booking.specialistId,
        );
        if (specialistData != null) {
          results.add(
            BookingWithSpecialist(
              booking: booking,
              specialist: UserModel.fromMap(specialistData),
            ),
          );
        }
      }
      return Right(results);
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'PreviousBookingsRepository.getUserBookings',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'PreviousBookingsRepository.getUserBookings',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'PreviousBookingsRepository.getUserBookings',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
