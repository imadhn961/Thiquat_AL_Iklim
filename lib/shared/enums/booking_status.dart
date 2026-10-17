import 'package:flutter/widgets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

enum BookingStatus { pending, accepted, inProgress, completed, cancelled }

extension BookingStatusLabel on BookingStatus {
  String label(BuildContext context) {
    switch (this) {
      case BookingStatus.pending:
        return S.of(context).bookingStatusPending;
      case BookingStatus.accepted:
        return S.of(context).bookingStatusAccepted;
      case BookingStatus.inProgress:
        return S.of(context).bookingStatusInProgress;
      case BookingStatus.completed:
        return S.of(context).bookingStatusCompleted;
      case BookingStatus.cancelled:
        return S.of(context).bookingStatusCancelled;
    }
  }

  Color get color {
    switch (this) {
      case BookingStatus.pending:
        return AppColor.statusPending;
      case BookingStatus.accepted:
        return AppColor.statusSuccess;
      case BookingStatus.inProgress:
        return AppColor.statusInProgress;
      case BookingStatus.completed:
        return AppColor.statusSuccess;
      case BookingStatus.cancelled:
        return AppColor.statusError;
    }
  }

  /// Still in progress from the specialist's side — neither completed nor
  /// cancelled, so it stays in the working queue.
  bool get isActive =>
      this == BookingStatus.pending ||
      this == BookingStatus.accepted ||
      this == BookingStatus.inProgress;
}
