import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/Main/presentation/view/main_view.dart';
import 'package:thiquat_al_iklim/features/SpecialistMain/presentation/view/Sepcialist_main_view.dart';
import 'package:thiquat_al_iklim/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/Specialist_SignUp_view.dart';
import 'package:thiquat_al_iklim/features/splash/data/splash_repository.dart';
import 'package:thiquat_al_iklim/features/splash/presentation/cubit/splash_state.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._splashRepository) : super(const SplashLoading(0.0));

  final SplashRepository _splashRepository;

  static const Duration _tick = Duration(milliseconds: 50);

  Timer? _timer;

  /// Drives the loading bar; once it fills, resolves where to navigate.
  void startLoading() {
    final loadingDuration = _splashRepository.loadingDuration;
    final totalTicks = loadingDuration.inMilliseconds ~/ _tick.inMilliseconds;
    var elapsedTicks = 0;
    _timer = Timer.periodic(_tick, (timer) async {
      elapsedTicks++;
      final progress = (elapsedTicks / totalTicks).clamp(0.0, 1.0);
      emit(SplashLoading(progress));
      if (progress >= 1.0) {
        timer.cancel();
        await _resolveDestination();
      }
    });
  }

  Future<void> _resolveDestination() async {
    emit(const SplashResolving());
    final user = await _splashRepository.getStoredUser();
    final pendingBookingId = _splashRepository.getPendingBookingId();
    final bookid = pendingBookingId != null && pendingBookingId.isNotEmpty
        ? pendingBookingId
        : null;
    if (user == null) {
      _splashRepository.clearPendingBookingId();
      emit(const SplashNavigate(OnboardingScreen.routeName));
      return;
    }

    if (user.role == UserRole.specialist) {
      final hasDocuments =
          user.identityImageUrl != null && user.selfieImageUrl != null;
      emit(
        hasDocuments
            ? SplashNavigate(SpecialistMainView.routeName, bookingId: bookid)
            : SplashNavigate(
                SpecialistSignupView.routeName,
                arguments: user,
                bookingId: bookid,
              ),
      );
      return;
    } else {
      emit(SplashNavigate(MainView.routeName, bookingId: bookid));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
