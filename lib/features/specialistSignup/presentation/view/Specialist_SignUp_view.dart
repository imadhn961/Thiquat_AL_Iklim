import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/data/specialist_signup_repository_impl.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/data/verification_documents_repository_impl.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/cubit/specialist_signup_cubit.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/cubit/verification_documents_cubit.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/widgets/specialist_sign_up_view_body.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SpecialistSignupView extends StatelessWidget {
  const SpecialistSignupView({super.key, required this.user});
  static const String routeName = '/specialist-signup';
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              SpecialistSignupCubit(SpecialistSignupRepositoryImpl(), user),
        ),
        BlocProvider(
          create: (_) =>
              VerificationDocumentsCubit(VerificationDocumentsRepositoryImpl()),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SpecialistSignUpViewBody(),
          ),
        ),
      ),
    );
  }
}
