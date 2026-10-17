import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/review/data/review_repository.dart';
import 'package:thiquat_al_iklim/shared/models/rating_model.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  ReviewRepositoryImpl({Database? database})
    : _database = database ?? FirestoreDatabase();

  final Database _database;

  static const String _usersCollection = 'users';

  @override
  Future<Either<Failure, void>> submitRating({
    required String specialistId,
    required String raterId,
    required String bookingId,
    required double value,
    required String message,
  }) async {
    try {
      final specialistData = await _database.readData(
        path: _usersCollection,
        documentId: specialistId,
      );

      if (specialistData == null) {
        return const Left(UnknownFailure(message: 'الأخصائي غير موجود'));
      }
      final specialist = UserModel.fromMap(specialistData);

      final raterData = await _database.readData(
        path: _usersCollection,
        documentId: raterId,
      );
      final raterName = raterData != null
          ? UserModel.fromMap(raterData).name
          : '';

      final updatedRatings = [
        ...specialist.ratings.where((r) => r.id != bookingId),
        RatingModel(
          id: bookingId,
          specialistId: specialistId,
          raterId: raterId,
          raterName: raterName,
          value: value,
          message: message,
          createdAt: DateTime.now(),
        ),
      ];
      final average =
          updatedRatings.map((r) => r.value).reduce((a, b) => a + b) /
          updatedRatings.length;

      await _database.updateData(
        path: _usersCollection,
        documentId: specialistId,
        data: {
          'ratings': updatedRatings.map((r) => r.toMap()).toList(),
          'rating': average,
          'ratingCount': updatedRatings.length,
        },
      );
      return const Right(null);
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'ReviewRepository.submitRating',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'ReviewRepository.submitRating',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'ReviewRepository.submitRating',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
