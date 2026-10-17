import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/search/data/search_repository.dart';
import 'package:thiquat_al_iklim/features/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._repository) : super(const SearchInitial());

  final SearchRepository _repository;

  Future<void> search(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      emit(const SearchInitial());
      return;
    }

    emit(const SearchLoading());
    final result = await _repository.searchSpecialists(trimmed);
    result.fold(
      (failure) => emit(SearchError(failure.userMessage)),
      (specialists) =>
          emit(SearchLoaded(query: trimmed, results: specialists)),
    );
  }
}
