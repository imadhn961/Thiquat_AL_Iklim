import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/data/specialist_signup_repository.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/cubit/specialist_signup_state.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/widgets/specialist_professional_details_step.dart';
import 'package:thiquat_al_iklim/shared/enums/verification_status.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SpecialistSignupCubit extends Cubit<SpecialistSignupState> {
  SpecialistSignupCubit(this._repository, this._baseUser)
    : super(const SpecialistSignupInitial());

  final SpecialistSignupRepository _repository;
  final UserModel _baseUser;

  String get uid => _baseUser.uid;

  Future<void> submitProfile({
    required String address,
    required String profession,
    required String specialistCategory,
    required SpecialistExperienceRange experienceRange,
    required String description,
    required String identityImageUrl,
    required String selfieImageUrl,
  }) async {
    emit(const SpecialistSignupLoading());
    final updatedUser = _baseUser.copyWith(
      address: address,
      specialization: profession,
      specialistCategory: specialistCategory,
      yearsOfExperience: experienceRange.representativeYears,
      description: description,
      identityImageUrl: identityImageUrl,
      selfieImageUrl: selfieImageUrl,
      verificationStatus: VerificationStatus.pending,
    );
    final result = await _repository.completeProfile(updatedUser);
    await result.fold(
      (failure) => _rollBackAccount(failure.userMessage),
      (_) async => emit(const SpecialistSignupSuccess()),
    );
  }

  Future<void> _rollBackAccount(String reason) async {
    await _repository.deleteAccount(_baseUser.uid);
    emit(SpecialistSignupRolledBack(reason));
  }
}
