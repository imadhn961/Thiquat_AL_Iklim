import 'package:dartz/dartz.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/features/booking/data/model/book_model.dart';

abstract class BookingRepository {
  Future<Either<Failure, BookModel>> createBooking(BookModel booking);
}
