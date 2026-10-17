import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/auth_firebase.dart';
import 'package:thiquat_al_iklim/core/utils/app_logger.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';
import 'package:thiquat_al_iklim/features/bookingPage/data/booking_page_repository.dart';
import 'package:thiquat_al_iklim/features/bookingPage/data/model/booking_page_error.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/cubit/booking_page_state.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class BookingPageCubit extends Cubit<BookingPageState> {
  BookingPageCubit(this._repository) : super(const BookingPageInitial());

  final BookingPageRepository _repository;
  StreamSubscription? _subscription;

  // Cached so the specialist isn't re-fetched on every status update — only
  // when the booking actually points at a different specialist.
  String? _cachedSpecialistId;
  UserModel? _cachedSpecialist;

  // Sets which booking to track and starts listening to its live status.
  // Called right after a new booking is created so the booking page always
  // reflects the current record.
  void watchBooking(String? bookingId) {
    _subscription?.cancel();
    _cachedSpecialistId = null;
    _cachedSpecialist = null;
    emit(const BookingPageLoading());
    if (bookingId == null) {
      emit(const BookingPageInitial());
      return;
    }
    _subscription = _repository
        .streamBooking(bookingId!)
        .listen(
          (either) => either.fold(
            (failure) => emit(BookingPageError(failure)),
            _onBooking,
          ),
          onError: (Object error, StackTrace stackTrace) {
            emit(BookingPageError(_mapStreamError(error, stackTrace)));
          },
        );
  }

  // Maps a raw stream error (e.g. a Firestore permission-denied exception)
  // onto the Failure hierarchy so the UI never sees exception text; the full
  // technical detail is still logged.
  Failure _mapStreamError(Object error, StackTrace stackTrace) {
    if (error is FirebaseException) {
      AppLogger.error(
        'BookingPageCubit.watchBooking',
        error,
        code: error.code,
        stackTrace: stackTrace,
      );
      return FirestoreFailure.fromException(error);
    }
    if (error is SocketException) {
      AppLogger.error(
        'BookingPageCubit.watchBooking',
        error,
        stackTrace: stackTrace,
      );
      return const NetworkFailure();
    }
    AppLogger.error(
      'BookingPageCubit.watchBooking',
      error,
      stackTrace: stackTrace,
    );
    return const UnknownFailure(
      message: 'تعذر تحميل بيانات الحجز، يرجى المحاولة مرة أخرى',
    );
  }

  Future<void> _onBooking(BookModel booking) async {
    if (booking.userId != AuthFirebase().currentUser?.uid) {
      emit(
        const BookingPageError(
          BookingPageFailure(BookingPageErrorKind.unauthorized),
        ),
      );
      _subscription?.cancel();
      _subscription = null;
      return;
    }

    if (_cachedSpecialistId != booking.specialistId) {
      final result = await _repository.getSpecialist(booking.specialistId);
      _cachedSpecialistId = booking.specialistId;
      _cachedSpecialist = result.fold((_) => null, (specialist) => specialist);
    }
    emit(BookingPageLoaded(booking, specialist: _cachedSpecialist));

    // Nothing more will change on a finished booking — stop listening.
    if (booking.status == BookingStatus.completed ||
        booking.status == BookingStatus.cancelled) {
      _subscription?.cancel();
      _subscription = null;
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
