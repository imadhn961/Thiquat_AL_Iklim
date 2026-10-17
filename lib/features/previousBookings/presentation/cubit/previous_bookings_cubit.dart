import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/previousBookings/data/previous_bookings_repository.dart';
import 'package:thiquat_al_iklim/features/previousBookings/presentation/cubit/previous_bookings_state.dart';

class PreviousBookingsCubit extends Cubit<PreviousBookingsState> {
  PreviousBookingsCubit(this._repository) : super(const PreviousBookingsInitial());

  final PreviousBookingsRepository _repository;

  Future<void> loadBookings(String userId) async {
    emit(const PreviousBookingsLoading());
    final result = await _repository.getUserBookings(userId);
    result.fold(
      (failure) => emit(PreviousBookingsError(failure.userMessage)),
      (bookings) => emit(PreviousBookingsLoaded(bookings)),
    );
  }
}
