import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';

class HelpFaqCard extends StatelessWidget {
  const HelpFaqCard({super.key, required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.surface,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              textAlign: TextAlign.right,
              style: AppTextStyle.TextSize17,
            ),
            const SizedBox(height: 10),
            Text(
              answer,
              textAlign: TextAlign.right,
              style: AppTextStyle.TextSize16.copyWith(
                color: AppColor.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
