import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

enum BookingTrackStepStatus { completed, current, upcoming, rejected }

extension BookingTrackStepStatusLabel on BookingTrackStepStatus {
  String label(BuildContext context) {
    switch (this) {
      case BookingTrackStepStatus.completed:
        return S.of(context).trackStepDoneTime;
      case BookingTrackStepStatus.current:
        return S.of(context).trackStepCurrentTime;
      case BookingTrackStepStatus.upcoming:
        return S.of(context).trackStepUpcomingTime;
      case BookingTrackStepStatus.rejected:
        return '';
    }
  }
}

class BookingTrackStep {
  const BookingTrackStep({
    required this.title,
    required this.status,
    this.subtitle,
  });

  final String title;
  final BookingTrackStepStatus status;
  final String? subtitle;
}

class BookingPageModel {
  const BookingPageModel._();

  static const List<BookingStatus> _order = [
    BookingStatus.pending,
    BookingStatus.accepted,
    BookingStatus.inProgress,
    BookingStatus.completed,
  ];

  static List<BookingTrackStep> steps(
    BuildContext context,
    BookingStatus current,
  ) {
    final currentIndex = _order.indexOf(current);
    final titles = [
      S.of(context).trackStepOrdered,
      S.of(context).trackStepAccepted,
      S.of(context).trackStepInProgress,
      S.of(context).trackStepDone,
    ];
    return List.generate(_order.length, (i) {
      final status = i < currentIndex
          ? BookingTrackStepStatus.completed
          : i == currentIndex
          ? BookingTrackStepStatus.current
          : BookingTrackStepStatus.upcoming;
      final isCurrentAccepted =
          status == BookingTrackStepStatus.current &&
          _order[i] == BookingStatus.accepted;
      return BookingTrackStep(
        title: titles[i],
        status: status,
        subtitle: isCurrentAccepted
            ? S.of(context).trackStepAcceptedConfirmNote
            : null,
      );
    });
  }
}
