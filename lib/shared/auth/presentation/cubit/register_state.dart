import 'package:equatable/equatable.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess(this.user);

  final UserModel user;

  @override
  List<Object?> get props => [user];
}

class RegisterError extends RegisterState {
  const RegisterError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
