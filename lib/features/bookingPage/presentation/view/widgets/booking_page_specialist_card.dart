import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/Functions/getLetter.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class BookingPageSpecialistCard extends StatelessWidget {
  const BookingPageSpecialistCard({
    super.key,
    required this.specialist,
    required this.profession,
  });

  final UserModel specialist;
  final String profession;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.roleClientPrimary,
            child: Text(
              getLetter(context, specialist.name),
              style: AppTextStyle.TextSize19.copyWith(color: AppColor.surface),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(specialist.name, style: AppTextStyle.TextSize17),
              const SizedBox(height: 4),
              Text(
                profession,
                style: AppTextStyle.TextSize14.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
