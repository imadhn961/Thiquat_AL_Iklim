import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/storage.dart';
import 'package:thiquat_al_iklim/core/services/supabase_storage_service.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/data/model/verification_document_urls.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/data/verification_documents_repository.dart';

class VerificationDocumentsRepositoryImpl
    implements VerificationDocumentsRepository {
  VerificationDocumentsRepositoryImpl({Storage? storage})
    : _storage = storage ?? SupabaseStorageService();

  final Storage _storage;

  static const String _bucket = 'verification-documents';

  @override
  Future<Either<Failure, VerificationDocumentUrls>> uploadDocuments({
    required String uid,
    required File identityImage,
    required File selfieImage,
  }) async {
    try {
      final identityImageUrl = await _storage.uploadFile(
        bucket: _bucket,
        path: '$uid/identity.jpg',
        file: identityImage,
      );
      final selfieImageUrl = await _storage.uploadFile(
        bucket: _bucket,
        path: '$uid/selfie.jpg',
        file: selfieImage,
      );
      return Right(
        VerificationDocumentUrls(
          identityImageUrl: identityImageUrl,
          selfieImageUrl: selfieImageUrl,
        ),
      );
    } on SocketException catch (e, stackTrace) {
      AppLogger.error(
        'VerificationDocumentsRepository.uploadDocuments',
        e,
        stackTrace: stackTrace,
      );
      return const Left(NetworkFailure());
    } on StorageException catch (e, stackTrace) {
      AppLogger.error(
        'VerificationDocumentsRepository.uploadDocuments',
        e,
        code: e.statusCode,
        stackTrace: stackTrace,
      );
      return Left(StorageFailure.fromException(e));
    } catch (e, stackTrace) {
      AppLogger.error(
        'VerificationDocumentsRepository.uploadDocuments',
        e,
        stackTrace: stackTrace,
      );
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
