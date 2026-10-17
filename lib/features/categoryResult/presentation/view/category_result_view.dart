import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/categoryResult/data/category_result_repository_impl.dart';
import 'package:thiquat_al_iklim/features/categoryResult/presentation/cubit/category_result_cubit.dart';
import 'package:thiquat_al_iklim/features/categoryResult/presentation/cubit/category_result_state.dart';
import 'package:thiquat_al_iklim/features/categoryResult/presentation/view/widgets/specialist_result_card.dart';
import 'package:thiquat_al_iklim/features/home/data/models/category_model.dart';
import 'package:thiquat_al_iklim/core/widgets/Custom_Specialist_container.dart';
import 'package:thiquat_al_iklim/features/specialistDetail/presentation/view/specialist_detail_view.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class CategoryResultView extends StatelessWidget {
  const CategoryResultView({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CategoryResultCubit(CategoryResultRepositoryImpl())
            ..loadByCategory(categoryModel.nameKey),
      child: Scaffold(
        appBar: AppBar(title: Text(categoryModel.localizedName(context))),
        body: BlocBuilder<CategoryResultCubit, CategoryResultState>(
          builder: (context, state) {
            if (state is CategoryResultLoading ||
                state is CategoryResultInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CategoryResultError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyle.TextSize17.copyWith(
                    color: AppColor.statusError,
                  ),
                ),
              );
            }
            final specialists = (state as CategoryResultLoaded).specialists;
            if (specialists.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).categoryResultEmpty,
                  style: AppTextStyle.TextSize17,
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: specialists.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SpecialistDetailView.routeName,
                      arguments: SpecialistDetailArgs(
                        specialist: specialists[index],
                        profession: categoryModel.localizedName(context),
                      ),
                    );
                  },
                  child: CustomSpecialistContainer(
                    user: specialists[index],
                    rebooking: false,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
