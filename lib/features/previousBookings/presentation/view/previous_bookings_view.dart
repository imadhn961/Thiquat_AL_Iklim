import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/previousBookings/data/previous_bookings_repository_impl.dart';
import 'package:thiquat_al_iklim/features/previousBookings/presentation/cubit/previous_bookings_cubit.dart';
import 'package:thiquat_al_iklim/features/previousBookings/presentation/cubit/previous_bookings_state.dart';
import 'package:thiquat_al_iklim/features/previousBookings/presentation/view/widgets/previous_booking_card.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class PreviousBookingsView extends StatelessWidget {
  const PreviousBookingsView({super.key, required this.userId});

  static const String routeName = 'PreviousBookings';

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PreviousBookingsCubit(PreviousBookingsRepositoryImpl())
        ..loadBookings(userId),
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0,
          title: Text(
            S.of(context).menuPastBookings,
            style: AppTextStyle.TextSize19,
          ),
        ),
        body: BlocBuilder<PreviousBookingsCubit, PreviousBookingsState>(
          builder: (context, state) {
            if (state is PreviousBookingsLoading ||
                state is PreviousBookingsInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PreviousBookingsError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyle.TextSize17.copyWith(
                    color: AppColor.statusError,
                  ),
                ),
              );
            }
            final bookings = (state as PreviousBookingsLoaded).bookings;
            if (bookings.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).previousBookingsEmpty,
                  style: AppTextStyle.TextSize17,
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: bookings.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = bookings[index];
                return PreviousBookingCard(
                  specialist: item.specialist,
                  status: item.booking.status,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
