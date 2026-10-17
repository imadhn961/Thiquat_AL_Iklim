import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/Functions/getUser.dart';
import 'package:thiquat_al_iklim/core/services/shared_prefrences.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/features/bookingPage/bookingPage.dart';
import 'package:thiquat_al_iklim/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:thiquat_al_iklim/features/profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String routeName = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        top: false,
        child: ProfileViewBody(
          user: getUser()!,
          onLogoutTap: () {
            SharedPreferencesService.remove('user');
            SharedPreferencesService.remove('bookingId');
            context.read<BookingPageCubit>().watchBooking(null);
            FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(
              context,
              OnboardingScreen.routeName,
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
