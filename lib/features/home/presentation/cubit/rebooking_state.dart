import 'package:equatable/equatable.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class RebookingState extends Equatable {
  const RebookingState();

  @override
  List<Object?> get props => [];
}

class RebookingInitial extends RebookingState {
  const RebookingInitial();
}

class RebookingLoading extends RebookingState {
  const RebookingLoading();
}

/// Loaded successfully. [specialists] may be empty (show the "no data" text).
class RebookingLoaded extends RebookingState {
  const RebookingLoaded(this.specialists);

  final List<UserModel> specialists;

  @override
  List<Object?> get props => [specialists];
}

class RebookingError extends RebookingState {
  const RebookingError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
