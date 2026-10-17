import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/bookingPage/data/model/booking_page_model.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/view/widgets/booking_page_step_tile.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

class BookingPageStatusCard extends StatelessWidget {
  const BookingPageStatusCard({super.key, required this.status});

  final BookingStatus status;

  bool get _isRejected => status == BookingStatus.cancelled;

  @override
  Widget build(BuildContext context) {
    final steps = _isRejected
        ? const <BookingTrackStep>[]
        : BookingPageModel.steps(context, status);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).trackingTitle, style: AppTextStyle.TextSize17),
          const SizedBox(height: 20),
          if (_isRejected)
            BookingPageStepTile(
              step: BookingTrackStep(
                title: S.of(context).trackStepRejected,
                status: BookingTrackStepStatus.rejected,
              ),
              stepNumber: 1,
              isLast: true,
            )
          else
            for (var i = 0; i < steps.length; i++)
              BookingPageStepTile(
                step: steps[i],
                stepNumber: i + 1,
                isLast: i == steps.length - 1,
              ),
        ],
      ),
    );
  }
}
