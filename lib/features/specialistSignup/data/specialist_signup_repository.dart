import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class SpecialistSignupRepository {
  Future<Either<Failure, void>> completeProfile(UserModel user);

  // Rolls back a specialist signup that failed after the verification
  // photos were already uploaded — deletes both the Firestore profile doc
  // and the Firebase Auth account so no orphaned account is left behind.
  Future<Either<Failure, void>> deleteAccount(String uid);
}
