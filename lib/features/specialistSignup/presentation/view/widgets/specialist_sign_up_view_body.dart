import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_button.dart';
import 'package:thiquat_al_iklim/features/SpecialistMain/presentation/view/Sepcialist_main_view.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/cubit/specialist_signup_cubit.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/cubit/specialist_signup_state.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/cubit/verification_documents_cubit.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/cubit/verification_documents_state.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/widgets/custom_row_bar.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/widgets/final_specialist_sign_up_step.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/widgets/specialist_professional_details_step.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class SpecialistSignUpViewBody extends StatefulWidget {
  const SpecialistSignUpViewBody({super.key});

  @override
  State<SpecialistSignUpViewBody> createState() =>
      _SpecialistSignUpViewBodyState();
}

class _SpecialistSignUpViewBodyState extends State<SpecialistSignUpViewBody> {
  late PageController _pageController;
  int index = 0;

  String _address = '';
  String _specialistCategory = '';
  SpecialistExperienceRange? _experienceRange;
  String _description = '';
  String _profession = '';
  File? _identityImage;
  File? _selfieImage;

  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNext(BuildContext context) {
    if (index == 0) {
      if (_specialistCategory.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).specSignupCategoryRequired)),
        );
        return;
      }
    }
    if (index == 1) {
      if (_identityImage == null || _selfieImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).docUploadRequiredError)),
        );
        return;
      }
      context.read<VerificationDocumentsCubit>().uploadDocuments(
        uid: context.read<SpecialistSignupCubit>().uid,
        identityImage: _identityImage!,
        selfieImage: _selfieImage!,
      );
      return;
    }
    setState(() {
      index++;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<VerificationDocumentsCubit, VerificationDocumentsState>(
          listener: (context, state) {
            if (state is VerificationDocumentsError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is VerificationDocumentsSuccess) {
              context.read<SpecialistSignupCubit>().submitProfile(
                address: _address,
                profession: _profession,
                specialistCategory: _specialistCategory,
                experienceRange: _experienceRange!,
                description: _description,
                identityImageUrl: state.urls.identityImageUrl,
                selfieImageUrl: state.urls.selfieImageUrl,
              );
            }
          },
        ),
        BlocListener<SpecialistSignupCubit, SpecialistSignupState>(
          listener: (context, state) {
            if (state is SpecialistSignupRolledBack) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is SpecialistSignupSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).specSignupSubmitSuccess)),
              );
              Navigator.pushNamedAndRemoveUntil(
                context,
                SpecialistMainView.routeName,
                (route) => false,
              );
            }
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          final uploadState = context.watch<VerificationDocumentsCubit>().state;
          final submitState = context.watch<SpecialistSignupCubit>().state;
          final isSubmitting =
              uploadState is VerificationDocumentsLoading ||
              submitState is SpecialistSignupLoading;
          return Column(
            children: [
              customRowBar(selectIndex: index),
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SpecialistProfessionalDetailsStep(
                      onAddressChanged: (value) => _address = value,
                      onCategorySelected: (value) =>
                          _specialistCategory = value,
                      onExperienceSelected: (value) => _experienceRange = value,
                      onDescriptionChanged: (value) => _description = value,
                      onProfessionalChanged: (value) => _profession = value,
                    ),
                    FinalSpecialistSignUpStep(
                      onIdentityAttached: (file) => _identityImage = file,
                      onSelfieAttached: (file) => _selfieImage = file,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: isSubmitting ? null : () => _handleNext(context),
                child: isSubmitting
                    ? const SizedBox(
                        height: 50,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColor.roleSpecialist,
                          ),
                        ),
                      )
                    : CustomButton(
                        authSendOtp2: S.of(context).tutorialNext,
                        color: AppColor.roleSpecialist,
                      ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
