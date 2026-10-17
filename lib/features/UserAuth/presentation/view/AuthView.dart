import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/UserAuth/presentation/view/widgets/Register_view_body.dart';
import 'package:thiquat_al_iklim/shared/auth/data/Repo/register_repository_impl.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/cubit/register_cubit.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const String routeName = "Auth";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(RegisterRepositoryImpl(), UserRole.user),
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: RegisterAuth(),
        ),
      ),
    );
  }
}
