import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/categoryResult/data/category_result_repository.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class CategoryResultRepositoryImpl implements CategoryResultRepository {
  CategoryResultRepositoryImpl({Database? database})
    : _database = database ?? FirestoreDatabase();

  final Database _database;

  static const String _usersCollection = 'users';

  @override
  Future<Either<Failure, List<UserModel>>> getSpecialistsByCategory(
    String categoryKey,
  ) async {
    try {
      final docs = await _database.readCollectionWhere(
        path: _usersCollection,
        filters: {"specialistCategory": categoryKey},
      );
      final List<UserModel> users = docs.map((e) {
        return UserModel.fromMap(e);
      }).toList();
      return Right(users);
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'CategoryResultRepository.getSpecialistsByCategory',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'CategoryResultRepository.getSpecialistsByCategory',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'CategoryResultRepository.getSpecialistsByCategory',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
