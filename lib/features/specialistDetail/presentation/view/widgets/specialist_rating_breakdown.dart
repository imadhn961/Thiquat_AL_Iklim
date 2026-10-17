import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/models/rating_model.dart';

class SpecialistRatingBreakdown extends StatelessWidget {
  const SpecialistRatingBreakdown({
    super.key,
    required this.ratings,
    required this.rating,
    required this.ratingCount,
  });

  final List<RatingModel> ratings;
  final double rating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    final maxY = ratingCount == 0 ? 1.0 : ratingCount.toDouble();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 150,
            child: BarChart(
              BarChartData(
                rotationQuarterTurns: 1,
                alignment: BarChartAlignment.spaceAround,
                maxY: maxY,
                minY: 0,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barTouchData: const BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),
                  leftTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 24,
                      getTitlesWidget: (value, meta) {
                        final star = 5 - value.toInt();
                        return SideTitleWidget(
                          meta: meta,
                          child: Text('$star', style: AppTextStyle.TextSize14),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: List.generate(5, (index) {
                  final star = 5 - index;
                  final count = ratings
                      .where((r) => r.value.round() == star)
                      .length;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: count.toDouble(),
                        color: AppColor.roleCTA,
                        width: 8,
                        borderRadius: BorderRadius.circular(4),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: maxY,
                          color: AppColor.border,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Text('$rating', style: AppTextStyle.TextSize28),
            const SizedBox(height: 4),
            Text(
              '$ratingCount ${S.of(context).profileReviewsCountSuffix}',
              style: AppTextStyle.TextSize14.copyWith(
                color: AppColor.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
