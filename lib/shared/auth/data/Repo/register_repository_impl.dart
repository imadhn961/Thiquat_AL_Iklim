import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/auth_firebase.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/shared/auth/data/Repo/register_repository.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({AuthFirebase? authFirebase, Database? database})
    : _authFirebase = authFirebase ?? AuthFirebase(),
      _database = database ?? FirestoreDatabase();

  final AuthFirebase _authFirebase;
  final Database _database;

  static const String _usersCollection = 'users';

  @override
  Future<Either<Failure, UserModel>> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required UserRole role,
  }) async {
    try {
      final user = await _authFirebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user == null) {
        return const Left(UnknownFailure(message: 'تعذر إنشاء الحساب'));
      }

      final userModel = UserModel(
        uid: user.uid,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: '',
        createdAt: DateTime.now(),
        role: role,
      );

      await _database.createData(
        path: _usersCollection,
        documentId: user.uid,
        data: userModel.toMap(),
      );

      await _authFirebase.saveUser(userModel);

      return Right(userModel);
    } on Failure catch (failure) {
      return Left(failure);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromException(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> registerWithGoogle({
    required UserRole role,
  }) {
    return _registerWithSocial(_authFirebase.signInWithGoogle, role);
  }

  @override
  Future<Either<Failure, UserModel>> registerWithApple({
    required UserRole role,
  }) {
    return _registerWithSocial(_authFirebase.signInWithApple, role);
  }

  Future<Either<Failure, UserModel>> _registerWithSocial(
    Future<User?> Function() authenticate,
    UserRole role,
  ) async {
    try {
      final user = await authenticate();
      if (user == null) {
        return const Left(UnknownFailure(message: 'تعذر إنشاء الحساب'));
      }

      final existingData = await _database.readData(
        path: _usersCollection,
        documentId: user.uid,
      );
      if (existingData != null) {
        return Right(UserModel.fromMap(existingData));
      }

      final userModel = UserModel(
        uid: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        phoneNumber: user.phoneNumber ?? '',
        password: '',
        createdAt: DateTime.now(),
        role: role,
      );

      await _database.createData(
        path: _usersCollection,
        documentId: user.uid,
        data: userModel.toMap(),
      );

      return Right(userModel);
    } on Failure catch (failure) {
      return Left(failure);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromException(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
