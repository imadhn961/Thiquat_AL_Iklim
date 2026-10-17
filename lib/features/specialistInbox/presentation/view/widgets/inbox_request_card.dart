import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/Functions/getLetter.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/utils/booking_time_utils.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/data/model/inbox_request.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

class InboxRequestCard extends StatelessWidget {
  const InboxRequestCard({
    super.key,
    required this.request,
    required this.onAccept,
    required this.onDecline,
    required this.onStart,
    required this.onComplete,
  });

  final InboxRequest request;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final VoidCallback onStart;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColor.roleClientPrimary,
                      child: Text(
                        getLetter(context, request.clientName),
                        style: AppTextStyle.TextSize19.copyWith(
                          color: AppColor.surface,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            request.clientName,
                            style: AppTextStyle.TextSize17,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            request.service,
                            style: AppTextStyle.TextSize14.copyWith(
                              color: AppColor.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              _StatusBadge(status: request.status),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(
                Icons.schedule,
                size: 18,
                color: AppColor.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                bookingAppointmentLabel(context, request.appointmentDate),
                style: AppTextStyle.TextSize14.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(
                Icons.location_on_outlined,
                size: 18,
                color: AppColor.textSecondary,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  request.address,
                  style: AppTextStyle.TextSize14.copyWith(
                    color: AppColor.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          ..._actions(context),
        ],
      ),
    );
  }

  // Action row for the request's current stage. Each stage exposes its
  // single forward step plus a cancel; completed/cancelled show nothing.
  List<Widget> _actions(BuildContext context) {
    final primary = switch (request.status) {
      BookingStatus.pending => (
        S.of(context).specInboxAccept,
        onAccept,
      ),
      BookingStatus.accepted => (
        S.of(context).specInboxStart,
        onStart,
      ),
      BookingStatus.inProgress => (
        S.of(context).specInboxComplete,
        onComplete,
      ),
      BookingStatus.completed || BookingStatus.cancelled => null,
    };
    if (primary == null) return const [];
    return [
      const SizedBox(height: 16),
      Row(
        children: [
          Expanded(
            child: _CardButton(
              label: primary.$1,
              onTap: primary.$2,
              filled: true,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _CardButton(
              label: S.of(context).specInboxDecline,
              onTap: onDecline,
              filled: false,
            ),
          ),
        ],
      ),
    ];
  }
}

class _CardButton extends StatelessWidget {
  const _CardButton({
    required this.label,
    required this.onTap,
    required this.filled,
  });

  final String label;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    const accent = AppColor.roleClientPrimary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? accent : AppColor.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: filled ? accent : AppColor.border),
        ),
        child: Text(
          label,
          style: AppTextStyle.TextSize16.copyWith(
            fontWeight: FontWeight.w700,
            color: filled ? AppColor.surface : AppColor.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final BookingStatus status;

  @override
  Widget build(BuildContext context) {
    final color = status.color;
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
