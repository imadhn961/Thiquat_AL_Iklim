import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/data/verification_documents_repository.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/cubit/verification_documents_state.dart';

class VerificationDocumentsCubit extends Cubit<VerificationDocumentsState> {
  VerificationDocumentsCubit(this._repository)
    : super(const VerificationDocumentsInitial());

  final VerificationDocumentsRepository _repository;

  Future<void> uploadDocuments({
    required String uid,
    required File identityImage,
    required File selfieImage,
  }) async {
    emit(const VerificationDocumentsLoading());
    final result = await _repository.uploadDocuments(
      uid: uid,
      identityImage: identityImage,
      selfieImage: selfieImage,
    );
    result.fold(
      (failure) => emit(VerificationDocumentsError(failure.userMessage)),
      (urls) => emit(VerificationDocumentsSuccess(urls)),
    );
  }
}
