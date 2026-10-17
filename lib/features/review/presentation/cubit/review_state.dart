import 'package:equatable/equatable.dart';

abstract class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object?> get props => [];
}

class ReviewInitial extends ReviewState {
  const ReviewInitial();
}

class ReviewSubmitting extends ReviewState {
  const ReviewSubmitting();
}

class ReviewSuccess extends ReviewState {
  const ReviewSuccess();
}

class ReviewError extends ReviewState {
  const ReviewError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
