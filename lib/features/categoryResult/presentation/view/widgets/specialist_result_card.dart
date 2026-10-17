import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SpecialistResultCard extends StatelessWidget {
  const SpecialistResultCard({
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
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.border, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColor.roleClientPrimary,
            child: Text(
              specialist.name.isNotEmpty ? specialist.name[0] : '',
              style: AppTextStyle.TextSize19,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(specialist.name, style: AppTextStyle.TextSize19),
                const SizedBox(height: 5),
                Text(
                  '$profession ⭐ ${specialist.rating ?? 0}',
                  style: AppTextStyle.TextSize16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
