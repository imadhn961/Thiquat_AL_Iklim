import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

String bookingDayName(BuildContext context, DateTime date) {
  switch (date.weekday) {
    case DateTime.sunday:
      return S.of(context).dayNameSunday;
    case DateTime.monday:
      return S.of(context).dayNameMonday;
    case DateTime.tuesday:
      return S.of(context).dayNameTuesday;
    case DateTime.wednesday:
      return S.of(context).dayNameWednesday;
    case DateTime.thursday:
      return S.of(context).dayNameThursday;
    case DateTime.friday:
      return S.of(context).dayNameFriday;
    case DateTime.saturday:
    default:
      return S.of(context).dayNameSaturday;
  }
}

String bookingTimeLabel(BuildContext context, DateTime time) {
  final isPm = time.hour >= 12;
  final displayHour = time.hour > 12 ? time.hour - 12 : time.hour;
  final hour = displayHour == 0 ? 12 : displayHour;
  final suffix = isPm
      ? S.of(context).bookingTimePm
      : S.of(context).bookingTimeAm;
  return '$hour:00 $suffix';
}

/// "اليوم" / "غداً" for today and tomorrow, otherwise the weekday name.
String bookingRelativeDayLabel(BuildContext context, DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);
  final daysAway = target.difference(today).inDays;
  if (daysAway == 0) return S.of(context).specInboxDateToday;
  if (daysAway == 1) return S.of(context).specInboxDateTomorrow;
  return bookingDayName(context, date);
}

/// Relative day plus time-of-day, e.g. "اليوم، 4:00 م".
String bookingAppointmentLabel(BuildContext context, DateTime date) {
  return '${bookingRelativeDayLabel(context, date)}، '
      '${bookingTimeLabel(context, date)}';
}
