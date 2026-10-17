import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/categoryResult/data/category_result_repository.dart';
import 'package:thiquat_al_iklim/features/categoryResult/presentation/cubit/category_result_state.dart';

class CategoryResultCubit extends Cubit<CategoryResultState> {
  CategoryResultCubit(this._repository) : super(const CategoryResultInitial());

  final CategoryResultRepository _repository;

  Future<void> loadByCategory(String categoryKey) async {
    emit(const CategoryResultLoading());
    final result = await _repository.getSpecialistsByCategory(categoryKey);
    result.fold(
      (failure) => emit(CategoryResultError(failure.userMessage)),
      (specialists) => emit(CategoryResultLoaded(specialists)),
    );
  }
}
