import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/shared/auth/data/Repo/login_repository_impl.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/cubit/login_cubit.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/view/widgets/login_view_body.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(LoginRepositoryImpl()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
