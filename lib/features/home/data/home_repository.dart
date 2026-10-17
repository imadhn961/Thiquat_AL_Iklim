import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class HomeRepository {
  /// Resolves the current user's `specialistIds` into full [UserModel]s for
  /// the "book again" section. Returns an empty list when the user has no
  /// previous bookings.
  Future<Either<Failure, List<UserModel>>> getRebookingSpecialists();
}
