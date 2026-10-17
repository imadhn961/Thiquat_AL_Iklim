import 'package:equatable/equatable.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class CategoryResultState extends Equatable {
  const CategoryResultState();

  @override
  List<Object?> get props => [];
}

class CategoryResultInitial extends CategoryResultState {
  const CategoryResultInitial();
}

class CategoryResultLoading extends CategoryResultState {
  const CategoryResultLoading();
}

class CategoryResultLoaded extends CategoryResultState {
  const CategoryResultLoaded(this.specialists);

  final List<UserModel> specialists;

  @override
  List<Object?> get props => [specialists];
}

class CategoryResultError extends CategoryResultState {
  const CategoryResultError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
