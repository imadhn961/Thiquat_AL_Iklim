import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/auth_firebase.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/data/specialist_signup_repository.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SpecialistSignupRepositoryImpl implements SpecialistSignupRepository {
  SpecialistSignupRepositoryImpl({
    Database? database,
    AuthFirebase? authFirebase,
  }) : _database = database ?? FirestoreDatabase(),
       _authFirebase = authFirebase ?? AuthFirebase();

  final Database _database;
  final AuthFirebase _authFirebase;

  static const String _usersCollection = 'users';

  @override
  Future<Either<Failure, void>> completeProfile(UserModel user) async {
    try {
      await _database.updateData(
        path: _usersCollection,
        documentId: user.uid,
        data: user.toMap(),
      );
      await _authFirebase.saveUser(user);
      return const Right(null);
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistSignupRepository.completeProfile',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistSignupRepository.completeProfile',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistSignupRepository.completeProfile',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String uid) async {
    try {
      await _database.deleteData(path: _usersCollection, documentId: uid);
      await _authFirebase.currentUser?.delete();
      return const Right(null);
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistSignupRepository.deleteAccount',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseAuthException catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistSignupRepository.deleteAccount',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirebaseAuthFailure.fromException(e));
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistSignupRepository.deleteAccount',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'SpecialistSignupRepository.deleteAccount',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
