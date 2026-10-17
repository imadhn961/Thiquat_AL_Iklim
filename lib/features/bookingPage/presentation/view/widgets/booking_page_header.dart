import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class BookingPageHeader extends StatelessWidget {
  const BookingPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(S.of(context).trackingTitle, style: AppTextStyle.TextSize19),
        const Spacer(),
      ],
    );
  }
}
