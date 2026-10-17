import 'package:equatable/equatable.dart';

abstract class SpecialistSignupState extends Equatable {
  const SpecialistSignupState();

  @override
  List<Object?> get props => [];
}

class SpecialistSignupInitial extends SpecialistSignupState {
  const SpecialistSignupInitial();
}

class SpecialistSignupLoading extends SpecialistSignupState {
  const SpecialistSignupLoading();
}

class SpecialistSignupSuccess extends SpecialistSignupState {
  const SpecialistSignupSuccess();
}

// Emitted when completeProfile fails after the verification photos were
// already uploaded — the account (Firestore doc + Firebase Auth user) has
// been rolled back, so the UI should navigate away rather than offer retry.
class SpecialistSignupRolledBack extends SpecialistSignupState {
  const SpecialistSignupRolledBack(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
