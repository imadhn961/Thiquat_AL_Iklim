import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';

class BookingProgressBar extends StatelessWidget {
  const BookingProgressBar({
    super.key,
    required this.currentStep,
    required this.stepCount,
  });

  final int currentStep;
  final int stepCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(stepCount, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              height: 6,
              decoration: BoxDecoration(
                color: index <= currentStep
                    ? AppColor.roleCTA
                    : AppColor.border,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        );
      }),
    );
  }
}
