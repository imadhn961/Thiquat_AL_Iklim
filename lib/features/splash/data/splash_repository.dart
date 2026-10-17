import 'package:thiquat_al_iklim/core/Functions/getUser.dart';
import 'package:thiquat_al_iklim/core/services/shared_prefrences.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

/// Data layer for the Splash feature (remote/local data sources).
class SplashRepository {
  const SplashRepository();

  /// How long the splash loading bar runs before the app moves on.
  Duration get loadingDuration => const Duration(seconds: 20);

  /// Reads the persisted session user, or null if no one is signed in.
  Future<UserModel?> getStoredUser() async {
    if (SharedPreferencesService.getString('user').isEmpty) return null;
    try {
      return await getUser();
    } catch (_) {
      return null;
    }
  }

  String? getPendingBookingId() {
    final id = SharedPreferencesService.getString('bookingId');
    return id.isEmpty ? null : id;
  }

  void clearPendingBookingId() {
    SharedPreferencesService.remove('bookingId');
  }
}
