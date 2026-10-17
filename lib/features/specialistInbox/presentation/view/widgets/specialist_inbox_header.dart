import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class SpecialistInboxHeader extends StatelessWidget {
  const SpecialistInboxHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).specInboxGreeting,
            style: AppTextStyle.TextSize14.copyWith(
              color: AppColor.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            S.of(context).specInboxTitle,
            style: AppTextStyle.TextSize28.copyWith(color: AppColor.textPrimary),
          ),
        ],
      ),
    );
  }
}
