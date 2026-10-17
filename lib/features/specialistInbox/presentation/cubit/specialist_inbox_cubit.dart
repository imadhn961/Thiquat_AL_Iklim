import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/data/specialist_inbox_repository.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/presentation/cubit/specialist_inbox_state.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

class SpecialistInboxCubit extends Cubit<SpecialistInboxState> {
  SpecialistInboxCubit(this._repository)
    : super(const SpecialistInboxInitial());

  final SpecialistInboxRepository _repository;
  StreamSubscription? _subscription;

  // Subscribes to the signed-in specialist's live booking list. Every change
  // to any of their bookings re-emits the whole, re-filtered list.
  void watchRequests() {
    _subscription?.cancel();
    emit(const SpecialistInboxLoading());
    _subscription = _repository.watchRequests().listen(
      (either) => either.fold(
        (failure) => emit(SpecialistInboxError(failure.userMessage)),
        (requests) => emit(SpecialistInboxLoaded(List.unmodifiable(requests))),
      ),
      onError: (Object error) => emit(SpecialistInboxError(error.toString())),
    );
  }

  // Pending -> accepted. The card then offers the "start work" action.
  void acceptRequest(String id) => _updateStatus(id, BookingStatus.accepted);

  void startRequest(String id) => _updateStatus(id, BookingStatus.inProgress);

  // In progress -> completed. It drops out of the inbox on the next emission.
  void completeRequest(String id) => _updateStatus(id, BookingStatus.completed);

  // Any active request -> cancelled. It drops out of the inbox on the next
  // emission.
  void declineRequest(String id) => _updateStatus(id, BookingStatus.cancelled);

  Future<void> _updateStatus(String id, BookingStatus status) async {
    final result = await _repository.updateStatus(id, status);
    result.fold((failure) => emit(SpecialistInboxError(failure.userMessage)), (
      _,
    ) {
      // Success: the watch stream will re-emit the updated list.
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
