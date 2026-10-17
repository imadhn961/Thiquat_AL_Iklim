/// Data layer for the Onboarding feature (remote/local data sources).
class OnboardingRepository {
  const OnboardingRepository();

  /// How long the onboarding loading bar runs before the app moves on.
  Duration get loadingDuration => const Duration(seconds: 20);
}
