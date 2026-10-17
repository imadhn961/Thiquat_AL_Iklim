import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class SearchRepository {
  /// Returns the specialists whose name or specialization matches [query].
  /// An empty/blank query returns an empty list.
  Future<Either<Failure, List<UserModel>>> searchSpecialists(String query);
}
