import 'package:equatable/equatable.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess(this.user);

  final UserModel user;

  @override
  List<Object?> get props => [user];
}

class LoginError extends LoginState {
  const LoginError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
