import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/booking/data/booking_repository_impl.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/view/widgets/booking_view_body.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key, required this.specialistId});

  static const String routeName = '/booking';

  final String specialistId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingCubit(BookingRepositoryImpl()),
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0,
          foregroundColor: AppColor.textPrimary,
          title: Text(
            S.of(context).bookingTitle,
            style: AppTextStyle.TextSize17,
          ),
        ),
        body: BookingViewBody(specialistId: specialistId),
      ),
    );
  }
}
