import 'package:equatable/equatable.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

/// No query typed yet.
class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

/// Query ran successfully. [results] may be empty (show the "no data" message).
class SearchLoaded extends SearchState {
  const SearchLoaded({required this.query, required this.results});

  final String query;
  final List<UserModel> results;

  @override
  List<Object?> get props => [query, results];
}

class SearchError extends SearchState {
  const SearchError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
