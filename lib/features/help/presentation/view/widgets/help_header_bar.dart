import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class HelpHeaderBar extends StatelessWidget {
  const HelpHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            S.of(context).helpTitle,
            textAlign: TextAlign.right,
            style: AppTextStyle.TextSize22,
          ),
        ),
        const SizedBox(width: 12),
        InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.border, width: 1.5),
            ),
            child: const Icon(Icons.arrow_forward, color: AppColor.textPrimary),
          ),
        ),
      ],
    );
  }
}
