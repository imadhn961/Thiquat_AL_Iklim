import 'package:equatable/equatable.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/data/model/verification_document_urls.dart';

abstract class VerificationDocumentsState extends Equatable {
  const VerificationDocumentsState();

  @override
  List<Object?> get props => [];
}

class VerificationDocumentsInitial extends VerificationDocumentsState {
  const VerificationDocumentsInitial();
}

class VerificationDocumentsLoading extends VerificationDocumentsState {
  const VerificationDocumentsLoading();
}

class VerificationDocumentsSuccess extends VerificationDocumentsState {
  const VerificationDocumentsSuccess(this.urls);

  final VerificationDocumentUrls urls;

  @override
  List<Object?> get props => [urls];
}

class VerificationDocumentsError extends VerificationDocumentsState {
  const VerificationDocumentsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
