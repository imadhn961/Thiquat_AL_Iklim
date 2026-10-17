import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';
import 'package:thiquat_al_iklim/features/bookingPage/data/model/booking_page_error.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class BookingPageState extends Equatable {
  const BookingPageState();

  @override
  List<Object?> get props => [];
}

class BookingPageInitial extends BookingPageState {
  const BookingPageInitial();
}

class BookingPageLoading extends BookingPageState {
  const BookingPageLoading();
}

class BookingPageLoaded extends BookingPageState {
  const BookingPageLoaded(this.booking, {this.specialist});

  final BookModel booking;

  final UserModel? specialist;

  @override
  List<Object?> get props => [booking, specialist];
}

class BookingPageError extends BookingPageState {
  const BookingPageError(this.failure);

  final Failure failure;

  // Booking-page-specific failures (not found / unauthorized) and the
  // generic stream-error fallback resolve their text via S.of(context);
  // any other Failure (e.g. Firestore/network) falls back to its own
  // curated userMessage.
  String message(BuildContext context) {
    final failure = this.failure;
    if (failure is BookingPageFailure) return failure.kind.label(context);
    if (failure is UnknownFailure) return S.of(context).bookingPageErrorGeneric;
    return failure.userMessage;
  }

  @override
  List<Object?> get props => [failure];
}
