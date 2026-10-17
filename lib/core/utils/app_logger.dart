import 'dart:developer' as developer;

/// Developer-facing error log. Keeps the raw/technical detail out of the UI —
/// pair with `Failure.userMessage` for what's actually shown to the user.
class AppLogger {
  const AppLogger._();

  static void error(
    String context,
    Object error, {
    String? code,
    StackTrace? stackTrace,
  }) {
    developer.log(
      code != null ? '[$context] ($code) $error' : '[$context] $error',
      name: 'AppError',
      error: error,
      stackTrace: stackTrace,
      level: 1000,
    );
  }
}
