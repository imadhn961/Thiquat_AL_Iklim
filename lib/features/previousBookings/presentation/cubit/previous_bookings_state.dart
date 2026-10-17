import 'package:equatable/equatable.dart';
import 'package:thiquat_al_iklim/features/previousBookings/data/model/booking_with_specialist.dart';

abstract class PreviousBookingsState extends Equatable {
  const PreviousBookingsState();

  @override
  List<Object?> get props => [];
}

class PreviousBookingsInitial extends PreviousBookingsState {
  const PreviousBookingsInitial();
}

class PreviousBookingsLoading extends PreviousBookingsState {
  const PreviousBookingsLoading();
}

class PreviousBookingsLoaded extends PreviousBookingsState {
  const PreviousBookingsLoaded(this.bookings);

  final List<BookingWithSpecialist> bookings;

  @override
  List<Object?> get props => [bookings];
}

class PreviousBookingsError extends PreviousBookingsState {
  const PreviousBookingsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
