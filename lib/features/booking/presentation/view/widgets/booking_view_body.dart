import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/services/auth_firebase.dart';
import 'package:thiquat_al_iklim/core/services/shared_prefrences.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/cubit/booking_state.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/view/widgets/booking_details_step.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/view/widgets/booking_progress_bar.dart';
import 'package:thiquat_al_iklim/features/booking/presentation/view/widgets/booking_schedule_step.dart';
import 'package:thiquat_al_iklim/features/bookingPage/bookingPage.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class BookingViewBody extends StatefulWidget {
  const BookingViewBody({super.key, required this.specialistId});

  final String specialistId;

  @override
  State<BookingViewBody> createState() => _BookingViewBodyState();
}

class _BookingViewBodyState extends State<BookingViewBody> {
  static const List<int> _hours = [9, 11, 13, 15, 17, 19];

  late final PageController _pageController;
  late final List<DateTime> _days;

  int _stepIndex = 0;
  int _selectedDayIndex = 0;
  int _selectedHourIndex = 0;
  String _address = '';
  String _note = '';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    final today = DateTime.now();
    _days = List.generate(5, (index) {
      return DateTime(today.year, today.month, today.day + index);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  DateTime get _selectedDateTime {
    final day = _days[_selectedDayIndex];
    return DateTime(day.year, day.month, day.day, _hours[_selectedHourIndex]);
  }

  void _goToDetailsStep() {
    setState(() => _stepIndex = 1);
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _submit(BuildContext context) {
    if (_address.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).specSignupFieldRequired)),
      );
      return;
    }
    context.read<BookingCubit>().submitBooking(
      specialistId: widget.specialistId,
      userId: AuthFirebase().currentUser!.uid,
      appointmentDate: _selectedDateTime,
      address: _address,
      note: _note,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).bookingConfirmTitle)),
          );
          SharedPreferencesService.setString('bookingId', state.booking.id);
          context.read<BookingPageCubit>().watchBooking(state.booking.id);
          Navigator.pop(context);
        } else if (state is BookingError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              BookingProgressBar(currentStep: _stepIndex, stepCount: 2),
              const SizedBox(height: 20),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    BookingScheduleStep(
                      days: _days,
                      hours: _hours,
                      selectedDayIndex: _selectedDayIndex,
                      selectedHourIndex: _selectedHourIndex,
                      onDaySelected: (index) =>
                          setState(() => _selectedDayIndex = index),
                      onHourSelected: (index) =>
                          setState(() => _selectedHourIndex = index),
                      onContinue: _goToDetailsStep,
                    ),
                    BlocBuilder<BookingCubit, BookingState>(
                      builder: (context, state) {
                        return BookingDetailsStep(
                          selectedDate: _selectedDateTime,
                          onAddressChanged: (value) => _address = value,
                          onNoteChanged: (value) => _note = value,
                          onConfirm: () => _submit(context),
                          isSubmitting: state is BookingLoading,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
