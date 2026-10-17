import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/Functions/getLetter.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class PreviousBookingCard extends StatelessWidget {
  const PreviousBookingCard({
    super.key,
    required this.specialist,
    required this.status,
  });

  final UserModel specialist;
  final BookingStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.roleClientPrimary,
            child: Text(
              getLetter(context, specialist.name),
              style: AppTextStyle.TextSize19.copyWith(color: AppColor.surface),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(specialist.name, style: AppTextStyle.TextSize17),
                const SizedBox(height: 4),
                Text(
                  specialist.specialization ?? '',
                  style: AppTextStyle.TextSize14.copyWith(
                    color: AppColor.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _StatusBadge(status: status),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final BookingStatus status;

  Color get _color {
    switch (status) {
      case BookingStatus.pending:
        return AppColor.statusPending;
      case BookingStatus.accepted:
      case BookingStatus.inProgress:
        return AppColor.roleManager;
      case BookingStatus.completed:
        return AppColor.statusSuccess;
      case BookingStatus.cancelled:
        return AppColor.statusError;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.label(context),
        style: AppTextStyle.TextSize14.copyWith(color: color),
      ),
    );
  }
}
