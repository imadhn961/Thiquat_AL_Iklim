import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/specialistDetail/presentation/view/widgets/specialist_detail_header.dart';
import 'package:thiquat_al_iklim/features/specialistDetail/presentation/view/widgets/specialist_rating_breakdown.dart';
import 'package:thiquat_al_iklim/features/specialistDetail/presentation/view/widgets/specialist_review_tile.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SpecialistDetailViewBody extends StatelessWidget {
  const SpecialistDetailViewBody({super.key, required this.specialist});

  final UserModel specialist;

  @override
  Widget build(BuildContext context) {
    final ratingCount = specialist.ratingCount ?? specialist.ratings.length;

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpecialistDetailHeader(
            specialist: specialist,
            profession: specialist.specialization!,
          ),
          const SizedBox(height: 24),
          if ((specialist.description ?? '').isNotEmpty) ...[
            Text(S.of(context).profileBioTitle, style: AppTextStyle.TextSize19),
            const SizedBox(height: 10),
            Text(
              specialist.description!,
              style: AppTextStyle.TextSize16.copyWith(
                color: AppColor.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
          ],
          Text(
            S.of(context).profileReviewsTitle,
            style: AppTextStyle.TextSize19,
          ),
          const SizedBox(height: 16),
          SpecialistRatingBreakdown(
            ratings: specialist.ratings,
            rating: specialist.rating ?? 0,
            ratingCount: ratingCount,
          ),
          const SizedBox(height: 20),
          ...specialist.ratings.map(
            (rating) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SpecialistReviewTile(rating: rating),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
