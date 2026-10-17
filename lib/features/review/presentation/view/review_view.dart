import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/features/review/data/review_repository_impl.dart';
import 'package:thiquat_al_iklim/features/review/presentation/cubit/review_cubit.dart';
import 'package:thiquat_al_iklim/features/review/presentation/view/widgets/review_view_body.dart';

class ReviewArgs {
  const ReviewArgs({
    required this.specialistId,
    required this.specialistName,
    required this.bookingId,
  });

  final String specialistId;
  final String specialistName;
  final String bookingId;
}

class ReviewView extends StatelessWidget {
  const ReviewView({
    super.key,
    required this.specialistId,
    required this.specialistName,
    required this.bookingId,
  });

  static const String routeName = '/review';

  final String specialistId;
  final String specialistName;
  final String bookingId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReviewCubit(ReviewRepositoryImpl()),
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: ReviewViewBody(
            specialistId: specialistId,
            specialistName: specialistName,
            bookingId: bookingId,
          ),
        ),
      ),
    );
  }
}
