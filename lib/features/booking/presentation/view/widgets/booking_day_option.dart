import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/utils/booking_time_utils.dart';

class BookingDayOption extends StatelessWidget {
  const BookingDayOption({
    super.key,
    required this.date,
    required this.selected,
    required this.onTap,
  });

  final DateTime date;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: selected ? AppColor.roleClientPrimary : AppColor.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColor.roleClientPrimary : AppColor.border,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              bookingDayName(context, date),
              style: AppTextStyle.TextSize14.copyWith(
                color: selected ? AppColor.surface : AppColor.textSecondary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${date.day}',
              style: AppTextStyle.TextSize17.copyWith(
                color: selected ? AppColor.surface : AppColor.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
