import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/booking/data/booking_repository.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/cubit/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this._repository) : super(const BookingInitial());

  final BookingRepository _repository;

  Future<void> submitBooking({
    required String specialistId,
    required String userId,
    required DateTime appointmentDate,
    required String address,
    required String note,
  }) async {
    emit(const BookingLoading());
    final booking = BookModel(
      specialistId: specialistId,
      userId: userId,
      appointmentDate: appointmentDate,
      address: address,
      note: note,
      createdAt: DateTime.now(),
    );
    final result = await _repository.createBooking(booking);
    result.fold(
      (failure) => emit(BookingError(failure.userMessage)),
      (createdBooking) => emit(BookingSuccess(createdBooking)),
    );
  }
}
