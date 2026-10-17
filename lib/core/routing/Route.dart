import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/features/Main/presentation/view/main_view.dart';
import 'package:thiquat_al_iklim/features/SpecialistMain/presentation/view/Sepcialist_main_view.dart';
import 'package:thiquat_al_iklim/features/booking/booking.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/view/booking_page_view.dart';
import 'package:thiquat_al_iklim/features/categories/categories.dart';
import 'package:thiquat_al_iklim/features/SpecialistAuth/presentation/view/Specialist_View.dart';
import 'package:thiquat_al_iklim/features/help/help.dart';
import 'package:thiquat_al_iklim/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:thiquat_al_iklim/features/previousBookings/previousBookings.dart';
import 'package:thiquat_al_iklim/features/review/review.dart';
import 'package:thiquat_al_iklim/features/UserAuth/presentation/view/AuthView.dart';
import 'package:thiquat_al_iklim/features/roleOption/presentation/view/role_option_view.dart';
import 'package:thiquat_al_iklim/features/search/search.dart';
import 'package:thiquat_al_iklim/features/splash/presentation/view/splash_screen.dart';
import 'package:thiquat_al_iklim/features/specialistDetail/specialistDetail.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/Specialist_SignUp_view.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/view/login_view.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case OnboardingScreen.routeName:
        // No transition: splash and onboarding share the same dark background,
        // so an instant swap avoids the white flash a page animation exposes.
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, _, _) => const OnboardingScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      case RoleOptionView.routeName:
        return MaterialPageRoute(builder: (_) => const RoleOptionView());
      case AuthView.routeName:
        return MaterialPageRoute(builder: (_) => const AuthView());
      case SpecialistView.routeName:
        return MaterialPageRoute(builder: (_) => const SpecialistView());
      case MainView.routeName:
        return MaterialPageRoute(builder: (_) => MainView());
      case LoginView.routeName:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
          maintainState: false,
        );
      case SpecialistSignupView.routeName:
        UserModel user = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => SpecialistSignupView(user: user),
        );
      case SpecialistDetailView.routeName:
        final args = settings.arguments as SpecialistDetailArgs;
        return MaterialPageRoute(
          builder: (_) => SpecialistDetailView(
            specialist: args.specialist,
            profession: args.profession,
          ),
        );
      case BookingView.routeName:
        final specialistId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BookingView(specialistId: specialistId),
        );
      case BookingPageView.routeName:
        return MaterialPageRoute(builder: (_) => const BookingPageView());
      case CategoriesView.routeName:
        return MaterialPageRoute(builder: (_) => const CategoriesView());
      case SearchView.routeName:
        final initialQuery = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => SearchView(initialQuery: initialQuery),
        );
      case HelpView.routeName:
        return MaterialPageRoute(builder: (_) => const HelpView());
      case PreviousBookingsView.routeName:
        final userId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PreviousBookingsView(userId: userId),
        );
      case ReviewView.routeName:
        final args = settings.arguments as ReviewArgs;
        return MaterialPageRoute(
          builder: (_) => ReviewView(
            specialistId: args.specialistId,
            specialistName: args.specialistName,
            bookingId: args.bookingId,
          ),
        );
      case SpecialistMainView.routeName:
        return MaterialPageRoute(
          builder: (_) => SpecialistMainView(initialIndex: 0),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
