import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/features/previousBookings/data/model/booking_with_specialist.dart';

abstract class PreviousBookingsRepository {
  // All bookings made by this user, each paired with its specialist,
  // newest first.
  Future<Either<Failure, List<BookingWithSpecialist>>> getUserBookings(
    String userId,
  );
}
