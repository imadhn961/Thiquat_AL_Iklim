import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Curated, user-facing Arabic messages. `message`/`code` stay as the raw
// diagnostic detail for logging — never show them to the user directly.
const String _genericErrorMessage = 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقاً';
const String _networkErrorMessage = 'خطأ في اتصال الإنترنت';
const String _invalidCredentialsMessage =
    'اسم المستخدم أو كلمة المرور غير صحيحة';

abstract class Failure {
  const Failure({required this.message, this.code});

  final String message;
  final String? code;

  /// Safe, curated Arabic message to show the user. Subclasses override this
  /// to map specific error codes; unmapped codes fall back to the generic message.
  String get userMessage => _genericErrorMessage;

  /// True when the "failure" is really the user backing out of a flow
  /// (e.g. closing the Google account picker) — callers should reset to
  /// idle silently instead of surfacing [userMessage] as an error.
  bool get isCancelled => false;
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure({required super.message, super.code});

  factory FirebaseAuthFailure.fromException(FirebaseAuthException exception) {
    return FirebaseAuthFailure(
      message: exception.message ?? exception.code,
      code: exception.code,
    );
  }

  @override
  String get userMessage {
    switch (code) {
      case 'wrong-password':
      case 'user-not-found':
      case 'invalid-credential':
      case 'invalid-email':
      case 'INVALID_LOGIN_CREDENTIALS':
        return _invalidCredentialsMessage;
      case 'network-request-failed':
        return _networkErrorMessage;
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل';
      case 'weak-password':
        return 'كلمة المرور ضعيفة جداً، الرجاء اختيار كلمة مرور أقوى';
      case 'too-many-requests':
        return 'محاولات كثيرة جداً، الرجاء المحاولة لاحقاً';
      case 'user-disabled':
        return 'تم تعطيل هذا الحساب';
      default:
        return _genericErrorMessage;
    }
  }
}

class SocialSignInFailure extends Failure {
  const SocialSignInFailure({
    required super.message,
    super.code,
    this.isCancelled = false,
  });

  factory SocialSignInFailure.fromGoogleException(GoogleSignInException e) {
    return SocialSignInFailure(
      message: e.description ?? e.code.name,
      code: e.code.name,
      isCancelled: e.code == GoogleSignInExceptionCode.canceled,
    );
  }

  factory SocialSignInFailure.fromAppleException(
    SignInWithAppleAuthorizationException e,
  ) {
    return SocialSignInFailure(
      message: e.message,
      code: e.code.name,
      isCancelled: e.code == AuthorizationErrorCode.canceled,
    );
  }

  @override
  final bool isCancelled;

  @override
  String get userMessage {
    if (isCancelled) return 'تم إلغاء تسجيل الدخول';
    switch (code) {
      case 'uiUnavailable':
      case 'interrupted':
        return 'تعذر فتح نافذة تسجيل الدخول، يرجى المحاولة مرة أخرى';
      case 'clientConfigurationError':
      case 'providerConfigurationError':
      case 'unknown':
      case 'notHandled':
      case 'failed':
        return 'تعذر تسجيل الدخول عبر هذه الخدمة حالياً';
      default:
        return _genericErrorMessage;
    }
  }
}

class FirestoreFailure extends Failure {
  const FirestoreFailure({required super.message, super.code});

  factory FirestoreFailure.fromException(FirebaseException exception) {
    return FirestoreFailure(
      message: exception.message ?? exception.code,
      code: exception.code,
    );
  }

  @override
  String get userMessage {
    switch (code) {
      case 'unavailable':
      case 'deadline-exceeded':
        return _networkErrorMessage;
      default:
        return _genericErrorMessage;
    }
  }
}

class StorageFailure extends Failure {
  const StorageFailure({required super.message, super.code});

  factory StorageFailure.fromException(StorageException exception) {
    return StorageFailure(
      message: exception.message,
      code: exception.statusCode,
    );
  }

  @override
  String get userMessage {
    switch (code) {
      case '503':
      case '504':
        return _networkErrorMessage;
      default:
        return _genericErrorMessage;
    }
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure()
    : super(message: 'No internet connection', code: 'no-internet');

  @override
  String get userMessage => _networkErrorMessage;
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message, super.code});

  // These are already curated Arabic messages set at the call site
  // (e.g. 'تعذر إنشاء الحساب'), so pass them through as-is.
  @override
  String get userMessage => message;
}
