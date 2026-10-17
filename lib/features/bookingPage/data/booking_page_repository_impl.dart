import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';
import 'package:thiquat_al_iklim/features/bookingPage/data/booking_page_repository.dart';
import 'package:thiquat_al_iklim/features/bookingPage/data/model/booking_page_error.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class BookingPageRepositoryImpl implements BookingPageRepository {
  BookingPageRepositoryImpl({Database? database})
    : _database = database ?? FirestoreDatabase();

  final Database _database;

  static const String _bookingsCollection = 'bookings';
  static const String _usersCollection = 'users';

  // Genuine stream errors (e.g. permission-denied, network loss) are left to
  // propagate as stream errors rather than being wrapped here — callers
  // should handle them via the stream's `onError`.
  @override
  Stream<Either<Failure, BookModel>> streamBooking(String bookingId) {
    return _database
        .streamData(path: _bookingsCollection, documentId: bookingId)
        .map<Either<Failure, BookModel>>((data) {
          if (data == null) {
            return const Left(
              BookingPageFailure(BookingPageErrorKind.bookingNotFound),
            );
          }
          return Right(BookModel.fromMap(data, id: bookingId));
        });
  }

  @override
  Future<Either<Failure, UserModel>> getSpecialist(String specialistId) async {
    try {
      final data = await _database.readData(
        path: _usersCollection,
        documentId: specialistId,
      );
      if (data == null) {
        return const Left(
          BookingPageFailure(BookingPageErrorKind.specialistNotFound),
        );
      }
      return Right(UserModel.fromMap(data));
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'BookingPageRepository.getSpecialist',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'BookingPageRepository.getSpecialist',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'BookingPageRepository.getSpecialist',
        e,
        stackTrace: stackTrace,
      );
      return const Left(
        UnknownFailure(message: 'تعذر تحميل بيانات الأخصائي، يرجى المحاولة مرة أخرى'),
      );
    }
  }
}
