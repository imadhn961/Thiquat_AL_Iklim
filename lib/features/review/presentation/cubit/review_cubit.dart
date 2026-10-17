import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/review/data/review_repository.dart';
import 'package:thiquat_al_iklim/features/review/presentation/cubit/review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this._repository) : super(const ReviewInitial());

  final ReviewRepository _repository;

  Future<void> submitRating({
    required String specialistId,
    required String raterId,
    required String bookingId,
    required int stars,
    required String comment,
  }) async {
    emit(const ReviewSubmitting());
    final result = await _repository.submitRating(
      specialistId: specialistId,
      raterId: raterId,
      bookingId: bookingId,
      value: stars.toDouble(),
      message: comment,
    );
    result.fold(
      (failure) => emit(ReviewError(failure.userMessage)),
      (_) => emit(const ReviewSuccess()),
    );
  }
}
