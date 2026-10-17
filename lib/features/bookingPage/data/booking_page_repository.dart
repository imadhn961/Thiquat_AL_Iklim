import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class BookingPageRepository {
  // Real-time updates for a single booking (status changes, etc.).
  Stream<Either<Failure, BookModel>> streamBooking(String bookingId);

  // One-shot lookup of the specialist assigned to a booking.
  Future<Either<Failure, UserModel>> getSpecialist(String specialistId);
}
