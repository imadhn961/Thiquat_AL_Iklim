import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserModel>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> loginWithGoogle();

  Future<Either<Failure, UserModel>> loginWithApple();
}
