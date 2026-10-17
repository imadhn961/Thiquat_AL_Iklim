import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/bookingPage/data/model/booking_page_model.dart';

class BookingPageStepTile extends StatelessWidget {
  const BookingPageStepTile({
    super.key,
    required this.step,
    required this.stepNumber,
    required this.isLast,
  });

  final BookingTrackStep step;
  final int stepNumber;
  final bool isLast;

  bool get _isActive => step.status != BookingTrackStepStatus.upcoming;
  bool get _isRejected => step.status == BookingTrackStepStatus.rejected;

  @override
  Widget build(BuildContext context) {
    final activeColor = _isRejected ? AppColor.statusError : AppColor.statusSuccess;
    final inactiveColor = AppColor.border;
    final circleColor = _isActive ? activeColor : inactiveColor;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
                child: step.status == BookingTrackStepStatus.completed
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : _isRejected
                    ? const Icon(Icons.close, size: 16, color: Colors.white)
                    : Text(
                        '$stepNumber',
                        style: AppTextStyle.TextSize14.copyWith(
                          color: _isActive
                              ? Colors.white
                              : AppColor.textSecondary,
                        ),
                      ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: step.status == BookingTrackStepStatus.completed
                        ? activeColor
                        : inactiveColor,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: AppTextStyle.TextSize17.copyWith(
                      color: _isActive
                          ? AppColor.textPrimary
                          : AppColor.textSecondary,
                    ),
                  ),
                  if (!_isRejected) ...[
                    const SizedBox(height: 2),
                    Text(
                      step.subtitle ?? step.status.label(context),
                      style: AppTextStyle.TextSize14.copyWith(
                        color: step.status == BookingTrackStepStatus.current
                            ? AppColor.statusSuccess
                            : AppColor.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
