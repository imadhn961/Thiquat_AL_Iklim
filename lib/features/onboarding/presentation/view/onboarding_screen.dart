import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thiquat_al_iklim/core/utils/appAssets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/onboarding/data/onboarding_repository.dart';
import 'package:thiquat_al_iklim/features/roleOption/presentation/view/role_option_view.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF194541),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.assetsImagesThiqatIcon,
                width: 96,
                height: 96,
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).appTitle,
                textAlign: TextAlign.center,
                style: AppTextStyle.TextSize28.copyWith(
                  color: AppColor.background,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                S.of(context).splashTagline,
                textAlign: TextAlign.center,
                style: AppTextStyle.TextSize16.copyWith(
                  color: AppColor.background,
                ),
              ),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RoleOptionView.routeName),
                child: Text(
                  S.of(context).splashTapToContinue,
                  style: AppTextStyle.TextSize14.copyWith(
                    color: AppColor.background,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
