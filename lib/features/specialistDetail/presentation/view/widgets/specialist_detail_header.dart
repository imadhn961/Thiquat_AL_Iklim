import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/Functions/getLetter.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/enums/verification_status.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SpecialistDetailHeader extends StatelessWidget {
  const SpecialistDetailHeader({
    super.key,
    required this.specialist,
    required this.profession,
  });

  final UserModel specialist;
  final String profession;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: AppColor.roleClientPrimary,
          child: Text(
            getLetter(context, specialist.name),
            style: AppTextStyle.TextSize22.copyWith(color: AppColor.surface),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      specialist.name,
                      style: AppTextStyle.TextSize22,
                    ),
                  ),
                  if (specialist.verificationStatus ==
                      VerificationStatus.approved) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.statusSuccess.withValues(alpha: .15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        S.of(context).resultsVerifiedBadge,
                        style: AppTextStyle.TextSize14.copyWith(
                          color: AppColor.statusSuccess,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 6),
              Text(
                profession,
                style: AppTextStyle.TextSize16.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: AppColor.roleCTA,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${specialist.rating ?? 0}',
                    style: AppTextStyle.TextSize17,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${specialist.ratingCount ?? specialist.ratings.length} ${S.of(context).profileReviewsCountSuffix}',
                    style: AppTextStyle.TextSize14.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
