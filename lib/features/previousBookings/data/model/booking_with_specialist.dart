import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class BookingWithSpecialist {
  const BookingWithSpecialist({required this.booking, required this.specialist});

  final BookModel booking;
  final UserModel specialist;
}
