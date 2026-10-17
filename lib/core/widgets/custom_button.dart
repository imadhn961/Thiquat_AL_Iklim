import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.authSendOtp2,
    required this.color,
  });
  final String authSendOtp2;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          authSendOtp2,
          style: AppTextStyle.TextSize19.copyWith(color: AppColor.background),
        ),
      ),
    );
  }
}
