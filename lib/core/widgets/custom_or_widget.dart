import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class CustomOrWidget extends StatelessWidget {
  const CustomOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: const Divider(color: Color(0xFFECE6DA))),
        const SizedBox(width: 10),
        Text(
          S.of(context).authOr,
          style: AppTextStyle.TextSize16.copyWith(
            color: const Color(0xFF8A8172),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: const Divider(color: Color(0xFFECE6DA))),
      ],
    );
  }
}
