import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/auth_firebase.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/shared/auth/data/Repo/login_repository.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({AuthFirebase? authFirebase, Database? database})
    : _authFirebase = authFirebase ?? AuthFirebase(),
      _database = database ?? FirestoreDatabase();

  final AuthFirebase _authFirebase;
  final Database _database;

  static const String _usersCollection = 'users';

  @override
  Future<Either<Failure, UserModel>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _login(
      () => _authFirebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, UserModel>> loginWithGoogle() {
    return _login(_authFirebase.signInWithGoogle);
  }

  @override
  Future<Either<Failure, UserModel>> loginWithApple() {
    return _login(_authFirebase.signInWithApple);
  }

  Future<Either<Failure, UserModel>> _login(
    Future<User?> Function() authenticate,
  ) async {
    try {
      final user = await authenticate();
      if (user == null) {
        AppLogger.error('LoginRepository.login', 'authenticate returned a null user');
        return const Left(UnknownFailure(message: 'تعذر تسجيل الدخول'));
      }

      final data = await _database.readData(
        path: _usersCollection,
        documentId: user.uid,
      );
      if (data == null) {
        AppLogger.error(
          'LoginRepository.login',
          'no user document found for uid ${user.uid}',
        );
        return const Left(
          UnknownFailure(message: 'لا يوجد حساب مرتبط بهذا المستخدم'),
        );
      }

      final userModel = UserModel.fromMap(data);

      return Right(userModel);
    } on Failure catch (failure) {
      AppLogger.error('LoginRepository.login', failure.message, code: failure.code);
      return Left(failure);
    } on SocketException catch (e, stackTrace) {
      AppLogger.error('LoginRepository.login', e, stackTrace: stackTrace);
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'LoginRepository.login',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error('LoginRepository.login', e, stackTrace: stackTrace);
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
