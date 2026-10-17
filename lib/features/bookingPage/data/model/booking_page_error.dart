import 'package:flutter/widgets.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

// Typed reasons the booking page can fail to show a booking. Keeping these
// as a kind (rather than a hardcoded message) lets the presentation layer
// resolve localized text via S.of(context), the same way BookingStatusLabel
// and BookingTrackStepStatusLabel already do in this feature.
enum BookingPageErrorKind { bookingNotFound, specialistNotFound, unauthorized }

extension BookingPageErrorKindLabel on BookingPageErrorKind {
  String label(BuildContext context) {
    switch (this) {
      case BookingPageErrorKind.bookingNotFound:
        return S.of(context).bookingPageErrorBookingNotFound;
      case BookingPageErrorKind.specialistNotFound:
        return S.of(context).bookingPageErrorSpecialistNotFound;
      case BookingPageErrorKind.unauthorized:
        return S.of(context).bookingPageErrorUnauthorized;
    }
  }
}

class BookingPageFailure extends Failure {
  // `message` can't interpolate `kind` (an enum) in a const constructor, so
  // it stays a fixed debug label — `kind` is the source of truth for text.
  const BookingPageFailure(this.kind) : super(message: 'BookingPageFailure');

  final BookingPageErrorKind kind;
}
