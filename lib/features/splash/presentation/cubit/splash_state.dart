import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashLoading extends SplashState {
  const SplashLoading(this.progress);

  final double progress;

  @override
  List<Object?> get props => [progress];
}

/// The progress bar has filled; now waiting on the user-model fetch before
/// navigating. The bar switches to an indeterminate animation here.
class SplashResolving extends SplashState {
  const SplashResolving();
}

class SplashNavigate extends SplashState {
  const SplashNavigate(this.routeName, {this.arguments, this.bookingId});

  final String routeName;
  final Object? arguments;
  final String? bookingId;

  @override
  List<Object?> get props => [routeName, arguments, bookingId];
}
