import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/home/data/home_repository.dart';
import 'package:thiquat_al_iklim/features/home/presentation/cubit/rebooking_state.dart';

class RebookingCubit extends Cubit<RebookingState> {
  RebookingCubit(this._repository) : super(const RebookingInitial());

  final HomeRepository _repository;

  Future<void> loadRebookingSpecialists() async {
    emit(const RebookingLoading());
    final result = await _repository.getRebookingSpecialists();
    result.fold(
      (failure) => emit(RebookingError(failure.userMessage)),
      (specialists) => emit(RebookingLoaded(specialists)),
    );
  }
}
