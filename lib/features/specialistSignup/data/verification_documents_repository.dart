import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/data/model/verification_document_urls.dart';

abstract class VerificationDocumentsRepository {
  Future<Either<Failure, VerificationDocumentUrls>> uploadDocuments({
    required String uid,
    required File identityImage,
    required File selfieImage,
  });
}
