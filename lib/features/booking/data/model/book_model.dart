import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

class BookModel {
  const BookModel({
    this.id = '',
    required this.specialistId,
    required this.userId,
    required this.appointmentDate,
    required this.address,
    this.note = '',
    this.status = BookingStatus.pending,
    required this.createdAt,
  });

  final String id;
  final String specialistId;
  final String userId;
  final DateTime appointmentDate;
  final String address;
  final String note;
  final BookingStatus status;
  final DateTime createdAt;

  BookModel copyWith({String? id}) {
    return BookModel(
      id: id ?? this.id,
      specialistId: specialistId,
      userId: userId,
      appointmentDate: appointmentDate,
      address: address,
      note: note,
      status: status,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'specialistId': specialistId,
      'userId': userId,
      'appointmentDate': appointmentDate.toIso8601String(),
      'address': address,
      'note': note,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map, {String id = ''}) {
    return BookModel(
      id: id,
      specialistId: map['specialistId'] as String,
      userId: map['userId'] as String,
      appointmentDate: DateTime.parse(map['appointmentDate'] as String),
      address: map['address'] as String,
      note: map['note'] as String? ?? '',
      status: BookingStatus.values.byName(map['status'] as String),
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
