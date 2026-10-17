import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_button.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/view/widgets/booking_day_option.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/view/widgets/booking_time_option.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class BookingScheduleStep extends StatelessWidget {
  const BookingScheduleStep({
    super.key,
    required this.days,
    required this.hours,
    required this.selectedDayIndex,
    required this.selectedHourIndex,
    required this.onDaySelected,
    required this.onHourSelected,
    required this.onContinue,
  });

  final List<DateTime> days;
  final List<int> hours;
  final int selectedDayIndex;
  final int selectedHourIndex;
  final ValueChanged<int> onDaySelected;
  final ValueChanged<int> onHourSelected;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final selectedDay = days[selectedDayIndex];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).bookingChooseDay,
            style: AppTextStyle.TextSize17,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(days.length, (index) {
              return BookingDayOption(
                date: days[index],
                selected: index == selectedDayIndex,
                onTap: () => onDaySelected(index),
              );
            }),
          ),
          const SizedBox(height: 28),
          Text(
            S.of(context).bookingChooseTime,
            style: AppTextStyle.TextSize17,
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: hours.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.8,
            ),
            itemBuilder: (context, index) {
              final time = DateTime(
                selectedDay.year,
                selectedDay.month,
                selectedDay.day,
                hours[index],
              );
              return BookingTimeOption(
                time: time,
                selected: index == selectedHourIndex,
                onTap: () => onHourSelected(index),
              );
            },
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: onContinue,
            child: CustomButton(
              authSendOtp2: S.of(context).bookingContinue,
              color: AppColor.roleCTA,
            ),
          ),
        ],
      ),
    );
  }
}
