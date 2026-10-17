import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/auth_firebase.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/home/data/home_repository.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({Database? database, AuthFirebase? auth})
    : _database = database ?? FirestoreDatabase(),
      _auth = auth ?? AuthFirebase();

  final Database _database;
  final AuthFirebase _auth;

  static const String _usersCollection = 'users';

  @override
  Future<Either<Failure, List<UserModel>>> getRebookingSpecialists() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return const Right([]);

      final currentUserData = await _database.readData(
        path: _usersCollection,
        documentId: uid,
      );
      if (currentUserData == null) return const Right([]);

      final specialistIds = UserModel.fromMap(currentUserData).specialistIds;
      if (specialistIds.isEmpty) return const Right([]);

      final specialists = <UserModel>[];
      for (final specialistId in specialistIds) {
        final specialistData = await _database.readData(
          path: _usersCollection,
          documentId: specialistId,
        );
        if (specialistData != null) {
          specialists.add(UserModel.fromMap(specialistData));
        }
      }
      return Right(specialists);
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'HomeRepository.getRebookingSpecialists',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'HomeRepository.getRebookingSpecialists',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'HomeRepository.getRebookingSpecialists',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
