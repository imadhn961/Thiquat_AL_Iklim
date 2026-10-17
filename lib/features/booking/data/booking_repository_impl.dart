import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/services/shared_prefrences.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/booking/data/booking_repository.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  BookingRepositoryImpl({Database? database})
    : _database = database ?? FirestoreDatabase();

  final Database _database;

  static const String _bookingsCollection = 'bookings';
  static const String _usersCollection = 'users';

  @override
  Future<Either<Failure, BookModel>> createBooking(BookModel booking) async {
    try {
      final id = await _database.createData(
        path: _bookingsCollection,
        data: booking.toMap(),
      );
      try {
        await _appendSpecialistToUser(
          userId: booking.userId,
          specialistId: booking.specialistId,
        );
      } catch (e, stackTrace) {
        AppLogger.error(
          'BookingRepository.appendSpecialistToUser',
          e,
          stackTrace: stackTrace,
        );
      }
      SharedPreferencesService.setString('lastBookingId', id);
      return Right(booking.copyWith(id: id));
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'BookingRepository.createBooking',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'BookingRepository.createBooking',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'BookingRepository.createBooking',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  Future<void> _appendSpecialistToUser({
    required String userId,
    required String specialistId,
  }) async {
    final userData = await _database.readData(
      path: _usersCollection,
      documentId: userId,
    );
    if (userData == null) return;

    final specialistIds = List<String>.from(
      (userData['specialistIds'] as List<dynamic>?) ?? const [],
    );
    if (specialistIds.contains(specialistId)) return;

    specialistIds.add(specialistId);
    await _database.updateData(
      path: _usersCollection,
      documentId: userId,
      data: {'specialistIds': specialistIds},
    );
  }
}
