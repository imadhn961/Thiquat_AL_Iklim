import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';

abstract class ReviewRepository {
  // Appends/replaces the rating for [bookingId] on the specialist's record
  // and recomputes their aggregate rating/ratingCount.
  Future<Either<Failure, void>> submitRating({
    required String specialistId,
    required String raterId,
    required String bookingId,
    required double value,
    required String message,
  });
}
