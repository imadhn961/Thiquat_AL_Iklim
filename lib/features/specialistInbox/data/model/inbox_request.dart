import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

/// A single incoming booking request shown in the specialist inbox.
class InboxRequest {
  const InboxRequest({
    required this.id,
    required this.clientName,
    required this.service,
    required this.appointmentDate,
    required this.address,
    required this.status,
  });

  final String id;
  final String clientName;
  final String service;
  final DateTime appointmentDate;
  final String address;
  final BookingStatus status;

  InboxRequest copyWith({BookingStatus? status}) {
    return InboxRequest(
      id: id,
      clientName: clientName,
      service: service,
      appointmentDate: appointmentDate,
      address: address,
      status: status ?? this.status,
    );
  }
}
