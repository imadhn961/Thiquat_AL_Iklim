import 'package:equatable/equatable.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/data/model/inbox_request.dart';

abstract class SpecialistInboxState extends Equatable {
  const SpecialistInboxState();

  @override
  List<Object?> get props => [];
}

class SpecialistInboxInitial extends SpecialistInboxState {
  const SpecialistInboxInitial();
}

class SpecialistInboxLoading extends SpecialistInboxState {
  const SpecialistInboxLoading();
}

class SpecialistInboxLoaded extends SpecialistInboxState {
  const SpecialistInboxLoaded(this.requests);

  final List<InboxRequest> requests;

  @override
  List<Object?> get props => [requests];
}

class SpecialistInboxError extends SpecialistInboxState {
  const SpecialistInboxError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
