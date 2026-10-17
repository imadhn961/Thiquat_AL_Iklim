import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/shared/auth/data/Repo/login_repository.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepository) : super(const LoginInitial());

  final LoginRepository _loginRepository;

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoading());
    final result = await _loginRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginError(failure.userMessage)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(const LoginLoading());
    final result = await _loginRepository.loginWithGoogle();
    result.fold(
      (failure) => emit(
        failure.isCancelled ? const LoginInitial() : LoginError(failure.userMessage),
      ),
      (user) => emit(LoginSuccess(user)),
    );
  }

  Future<void> loginWithApple() async {
    emit(const LoginLoading());
    final result = await _loginRepository.loginWithApple();
    result.fold(
      (failure) => emit(
        failure.isCancelled ? const LoginInitial() : LoginError(failure.userMessage),
      ),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
