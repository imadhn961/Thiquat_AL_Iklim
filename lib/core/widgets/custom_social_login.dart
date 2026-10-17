import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thiquat_al_iklim/core/utils/appAssets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class CustomSocialLogin extends StatelessWidget {
  const CustomSocialLogin({
    super.key,
    required this.text,
    required this.iconPath,
    required this.backgroundColor,
    required this.textColor,
  });
  final String text;
  final String iconPath;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.border, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, height: 24, width: 24),
          const SizedBox(width: 10),
          Text(text, style: AppTextStyle.TextSize16.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
