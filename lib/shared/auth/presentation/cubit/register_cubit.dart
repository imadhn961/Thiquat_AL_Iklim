import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/shared/auth/data/Repo/register_repository.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/cubit/register_state.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepository, this._role)
    : super(const RegisterInitial());

  final RegisterRepository _registerRepository;
  final UserRole _role;

  Future<void> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    emit(const RegisterLoading());
    final result = await _registerRepository.registerWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      role: _role,
    );
    result.fold(
      (failure) => emit(RegisterError(failure.userMessage)),
      (user) => emit(RegisterSuccess(user)),
    );
  }

  Future<void> registerWithGoogle() async {
    emit(const RegisterLoading());
    final result = await _registerRepository.registerWithGoogle(role: _role);
    result.fold(
      (failure) => emit(
        failure.isCancelled
            ? const RegisterInitial()
            : RegisterError(failure.userMessage),
      ),
      (user) => emit(RegisterSuccess(user)),
    );
  }

  Future<void> registerWithApple() async {
    emit(const RegisterLoading());
    final result = await _registerRepository.registerWithApple(role: _role);
    result.fold(
      (failure) => emit(
        failure.isCancelled
            ? const RegisterInitial()
            : RegisterError(failure.userMessage),
      ),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}
