import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thiquat_al_iklim/core/utils/appAssets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/SpecialistAuth/presentation/view/Specialist_View.dart';
import 'package:thiquat_al_iklim/features/UserAuth/presentation/view/AuthView.dart';
import 'package:thiquat_al_iklim/features/roleOption/presentation/view/widgets/custom_container_role.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/view/login_view.dart';

class RoleOptionView extends StatelessWidget {
  const RoleOptionView({super.key});
  static const routeName = "RoleOption";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            SvgPicture.asset(Assets.assetsImagesLogo, width: 64, height: 64),

            const SizedBox(height: 20),
            Text(
              S.of(context).roleSelectWelcome,
              style: AppTextStyle.TextSize22,
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).roleSelectQuestion,
              style: AppTextStyle.TextSize16,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AuthView.routeName);
              },
              child: CustomContainerRole(
                color: AppColor.roleClientBackground,
                iconPath: Assets.assetsImagesPerson,
                roleTitle: S.of(context).roleClientTitle,
                roleSubTitle: S.of(context).roleClientSubtitle,
                iconColor: AppColor.roleClientPrimary,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SpecialistView.routeName);
              },
              child: CustomContainerRole(
                color: AppColor.roleSpecialistBackground,
                roleTitle: S.of(context).roleSpecialistTitle,
                roleSubTitle: S.of(context).roleSpecialistSubtitle,
                iconPath: Assets.assetsImagesWrench,
                iconColor: AppColor.roleSpecialist,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: S.of(context).youHaveAccount,
                      style: AppTextStyle.TextSize16.copyWith(
                        color: Color(0xFF6B6255),
                      ),
                    ),
                    TextSpan(
                      text: S.of(context).authLoginTitle,
                      style: AppTextStyle.TextSize16.copyWith(
                        color: AppColor.roleCTA,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await Navigator.pushNamed(
                            context,
                            LoginView.routeName,
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
