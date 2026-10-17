import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/utils/booking_time_utils.dart';

class BookingTimeOption extends StatelessWidget {
  const BookingTimeOption({
    super.key,
    required this.time,
    required this.selected,
    required this.onTap,
  });

  final DateTime time;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColor.roleClientPrimary : AppColor.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColor.roleClientPrimary : AppColor.border,
            width: 1,
          ),
        ),
        child: Text(
          bookingTimeLabel(context, time),
          style: AppTextStyle.TextSize16.copyWith(
            color: selected ? AppColor.surface : AppColor.textPrimary,
          ),
        ),
      ),
    );
  }
}
