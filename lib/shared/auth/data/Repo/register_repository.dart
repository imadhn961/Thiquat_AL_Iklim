import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserModel>> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required UserRole role,
  });

  Future<Either<Failure, UserModel>> registerWithGoogle({
    required UserRole role,
  });

  Future<Either<Failure, UserModel>> registerWithApple({
    required UserRole role,
  });
}
