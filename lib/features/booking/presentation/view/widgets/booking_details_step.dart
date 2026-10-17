import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/widgets/Custom_text_form_field.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_button.dart';
import 'package:thiquat_al_iklim/core/utils/booking_time_utils.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class BookingDetailsStep extends StatelessWidget {
  const BookingDetailsStep({
    super.key,
    required this.selectedDate,
    required this.onAddressChanged,
    required this.onNoteChanged,
    required this.onConfirm,
    required this.isSubmitting,
  });

  final DateTime selectedDate;
  final ValueChanged<String> onAddressChanged;
  final ValueChanged<String> onNoteChanged;
  final VoidCallback onConfirm;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).bookingAddressLabel,
            style: AppTextStyle.TextSize16,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            onchanged: onAddressChanged,
            hintText: S.of(context).bookingAddressHint,
            typeText: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Text(S.of(context).bookingNoteLabel, style: AppTextStyle.TextSize16),
          const SizedBox(height: 12),
          CustomTextFormField(
            onchanged: onNoteChanged,
            hintText: S.of(context).bookingNoteHint,
            typeText: TextInputType.multiline,
            maxLines: 4,
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).bookingChosenTimeTitle,
            style: AppTextStyle.TextSize14.copyWith(
              color: AppColor.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${bookingDayName(context, selectedDate)} — ${bookingTimeLabel(context, selectedDate)}',
            style: AppTextStyle.TextSize17,
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: isSubmitting ? null : onConfirm,
            child: isSubmitting
                ? const SizedBox(
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(color: AppColor.roleCTA),
                    ),
                  )
                : CustomButton(
                    authSendOtp2: S.of(context).bookingConfirm,
                    color: AppColor.roleCTA,
                  ),
          ),
        ],
      ),
    );
  }
}
