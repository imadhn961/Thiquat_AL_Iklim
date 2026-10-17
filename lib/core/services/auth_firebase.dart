import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:thiquat_al_iklim/core/errors/failure.dart';
import 'package:thiquat_al_iklim/core/services/shared_prefrences.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class AuthFirebase {
  AuthFirebase({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  Future<void>? _googleSignInInitialization;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure.fromException(e);
    }
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure.fromException(e);
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      _googleSignInInitialization ??= _googleSignIn.initialize();
      await _googleSignInInitialization;

      final googleUser = await _googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;

      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure.fromException(e);
    } on GoogleSignInException catch (e) {
      throw SocialSignInFailure.fromGoogleException(e);
    }
  }

  Future<User?> signInWithApple() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider(
        'apple.com',
      ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

      final userCredential = await _firebaseAuth.signInWithCredential(
        oauthCredential,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure.fromException(e);
    } on SignInWithAppleAuthorizationException catch (e) {
      throw SocialSignInFailure.fromAppleException(e);
    }
  }

  // Apple requires a hashed nonce to mitigate replay attacks; the raw value
  // is sent to Firebase alongside the ID token so it can verify the hash.
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    return sha256.convert(utf8.encode(input)).toString();
  }

  Future<void> signOut() => _firebaseAuth.signOut();
  Future<void> saveUser(UserModel user) async {
    final userJson = jsonEncode(user.toMap());
    SharedPreferencesService.setString('user', userJson);
  }
}
