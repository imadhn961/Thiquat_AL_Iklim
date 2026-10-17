import 'dart:convert';
import 'dart:developer';

import 'package:thiquat_al_iklim/core/services/auth_firebase.dart';
import 'package:thiquat_al_iklim/core/services/shared_prefrences.dart';
import 'package:thiquat_al_iklim/features/SpecialistAuth/SpecialistAuth.dart';

AuthFirebase authFirebase = AuthFirebase();
UserModel? getUser() {
  final sharedPrefs = SharedPreferencesService.getString('user');
  log("Shared Prefs: $sharedPrefs");
  log("Current User: ${authFirebase.currentUser?.uid}");

  if (sharedPrefs.isEmpty || !isUserLoggedIn()) {
    log("Is User Logged In: ${isUserLoggedIn()}");
    log("Shared Prefs is Empty: ${sharedPrefs.isEmpty}");
    return null;
  }
  final user = jsonDecode(sharedPrefs) as Map<String, dynamic>;
  if (user['uid'] != authFirebase.currentUser?.uid) {
    log(
      "User ID does not match ${user['uid']} != ${authFirebase.currentUser?.uid}",
    );

    return null;
  }
  return UserModel.fromMap(user);
}

bool isUserLoggedIn() {
  final currentUser = authFirebase.currentUser;
  if (currentUser != null) {
    return true;
  } else {
    return false;
  }
}
