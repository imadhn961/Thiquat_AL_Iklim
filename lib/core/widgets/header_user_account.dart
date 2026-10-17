import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';

class HeaderUserAccount extends StatelessWidget {
  const HeaderUserAccount({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
              top: Radius.circular(10),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: AppTextStyle.TextSize16.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
