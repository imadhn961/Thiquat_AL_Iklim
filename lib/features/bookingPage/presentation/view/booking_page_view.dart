import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/cubit/booking_page_cubit.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/cubit/booking_page_state.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/view/widgets/booking_page_header.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/view/widgets/booking_page_rate_button.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/view/widgets/booking_page_specialist_card.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/view/widgets/booking_page_status_card.dart';
import 'package:thiquat_al_iklim/features/specialistDetail/presentation/view/specialist_detail_view.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

class BookingPageView extends StatelessWidget {
  const BookingPageView({super.key});

  static const String routeName = '/booking-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: BlocBuilder<BookingPageCubit, BookingPageState>(
          builder: (context, state) {
            if (state is BookingPageLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BookingPageError) {
              return Center(
                child: Text(
                  state.message(context),
                  style: AppTextStyle.TextSize17.copyWith(
                    color: AppColor.statusError,
                  ),
                ),
              );
            }
            if (state is! BookingPageLoaded || state is BookingPageInitial) {
              return Center(
                child: Text(
                  S.of(context).bookingPageEmpty,
                  style: AppTextStyle.TextSize17,
                ),
              );
            }

            final specialist = state.specialist;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BookingPageHeader(),
                  const SizedBox(height: 20),
                  if (specialist != null)
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          SpecialistDetailView.routeName,
                          arguments: SpecialistDetailArgs(
                            profession: specialist.specialization ?? '',
                            specialist: specialist,
                          ),
                        );
                      },
                      child: BookingPageSpecialistCard(
                        specialist: specialist,
                        profession: specialist.specialization ?? '',
                      ),
                    ),
                  const SizedBox(height: 20),
                  BookingPageStatusCard(status: state.booking.status),
                  const SizedBox(height: 20),
                  if (state.booking.status == BookingStatus.completed &&
                      specialist != null)
                    BookingPageRateButton(
                      booking: state.booking,
                      specialistName: specialist.name,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
