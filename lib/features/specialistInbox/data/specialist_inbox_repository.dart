import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/data/model/inbox_request.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

abstract class SpecialistInboxRepository {
  // Live list of the signed-in specialist's active booking requests
  // (pending / accepted / in progress), soonest appointment first. Re-emits
  // the whole re-filtered list on every change to any of their bookings;
  // completed and cancelled bookings are never included.
  Stream<Either<Failure, List<InboxRequest>>> watchRequests();

  // Persists a new status for one booking. The [watchRequests] stream then
  // re-emits, dropping the booking if it moved to completed/cancelled.
  Future<Either<Failure, void>> updateStatus(
    String bookingId,
    BookingStatus status,
  );
}
