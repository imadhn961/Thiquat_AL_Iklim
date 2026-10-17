import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/widgets/Custom_Specialist_container.dart';
import 'package:thiquat_al_iklim/features/home/data/models/category_model.dart';
import 'package:thiquat_al_iklim/features/home/presentation/cubit/rebooking_cubit.dart';
import 'package:thiquat_al_iklim/features/home/presentation/cubit/rebooking_state.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class RebookingSection extends StatelessWidget {
  const RebookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RebookingCubit, RebookingState>(
      builder: (context, state) {
        if (state is RebookingLoading || state is RebookingInitial) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is RebookingError) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              state.message,
              style: AppTextStyle.TextSize16.copyWith(
                color: AppColor.statusError,
              ),
            ),
          );
        }

        final specialists = (state as RebookingLoaded).specialists;
        if (specialists.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              S.of(context).homeRebookingEmpty,
              style: AppTextStyle.TextSize16.copyWith(
                color: AppColor.textSecondary,
              ),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: specialists.length,
          separatorBuilder: (_, _) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            final specialist = specialists[index];
            return CustomSpecialistContainer(user: specialist, rebooking: true);
          },
        );
      },
    );
  }
}
