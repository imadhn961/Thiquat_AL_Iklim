import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class CategoryResultRepository {
  Future<Either<Failure, List<UserModel>>> getSpecialistsByCategory(
    String categoryKey,
  );
}
