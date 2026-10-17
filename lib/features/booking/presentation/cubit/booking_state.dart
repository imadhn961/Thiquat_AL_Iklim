import 'package:equatable/equatable.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object?> get props => [];
}

class BookingInitial extends BookingState {
  const BookingInitial();
}

class BookingLoading extends BookingState {
  const BookingLoading();
}

class BookingSuccess extends BookingState {
  const BookingSuccess(this.booking);

  final BookModel booking;

  @override
  List<Object?> get props => [booking];
}

class BookingError extends BookingState {
  const BookingError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
