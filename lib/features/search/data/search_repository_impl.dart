import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/database.dart';
import 'package:thiquat_al_iklim/core/services/firestore_database.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/search/data/search_repository.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({Database? database})
    : _database = database ?? FirestoreDatabase();

  final Database _database;

  static const String _usersCollection = 'users';

  @override
  Future<Either<Failure, List<UserModel>>> searchSpecialists(
    String query,
  ) async {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) return const Right([]);

    try {
      // Firestore has no substring filter, so pull the specialists and match
      // name / specialization on the client.
      final docs = await _database.readCollectionWhere(
        path: _usersCollection,
        filters: {'role': UserRole.specialist.name},
      );

      final matches = docs
          .map(UserModel.fromMap)
          .where(
            (user) =>
                user.name.toLowerCase().contains(normalized) ||
                (user.specialization?.toLowerCase().contains(normalized) ??
                    false),
          )
          .toList();

      return Right(matches);
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'SearchRepository.searchSpecialists',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on FirebaseException catch (e, stackTrace) {
      AppLogger.error(
        'SearchRepository.searchSpecialists',
        e,
        code: e.code,
        stackTrace: stackTrace,
      );
      return Left(FirestoreFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'SearchRepository.searchSpecialists',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
