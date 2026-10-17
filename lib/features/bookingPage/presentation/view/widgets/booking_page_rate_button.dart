import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_button.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';
import 'package:thiquat_al_iklim/features/review/review.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class BookingPageRateButton extends StatelessWidget {
  const BookingPageRateButton({
    super.key,
    required this.booking,
    required this.specialistName,
  });

  final BookModel booking;
  final String specialistName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ReviewView.routeName,
          arguments: ReviewArgs(
            specialistId: booking.specialistId,
            specialistName: specialistName,
            bookingId: booking.id,
          ),
        );
      },
      child: CustomButton(
        authSendOtp2: S.of(context).trackingRateNow,
        color: AppColor.roleCTA,
      ),
    );
  }
}
