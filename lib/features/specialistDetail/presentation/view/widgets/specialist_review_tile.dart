import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/Functions/getLetter.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/shared/models/rating_model.dart';

class SpecialistReviewTile extends StatelessWidget {
  const SpecialistReviewTile({super.key, required this.rating});

  final RatingModel rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColor.roleClientPrimary,
          child: Text(
            getLetter(context, rating.raterName),
            style: AppTextStyle.TextSize16.copyWith(color: AppColor.surface),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      rating.raterName,
                      style: AppTextStyle.TextSize17,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < rating.value.round()
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        size: 16,
                        color: AppColor.roleCTA,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                rating.message,
                style: AppTextStyle.TextSize16.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
