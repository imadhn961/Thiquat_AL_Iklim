import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/categories/categories.dart';
import 'package:thiquat_al_iklim/features/home/data/home_repository_impl.dart';
import 'package:thiquat_al_iklim/features/home/presentation/cubit/rebooking_cubit.dart';
import 'package:thiquat_al_iklim/features/home/presentation/view/widgets/custom_grid_view_category.dart';
import 'package:thiquat_al_iklim/features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:thiquat_al_iklim/features/home/presentation/view/widgets/rebooking_section.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          RebookingCubit(HomeRepositoryImpl())..loadRebookingSpecialists(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        S.of(context).homeCategoriesTitle,
                        style: AppTextStyle.TextSize17,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          CategoriesView.routeName,
                        ),
                        child: Text(
                          S.of(context).homeViewAll,
                          style: AppTextStyle.TextSize14.copyWith(
                            color: AppColor.roleCTA,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const customGridViewCategory(catNumber: 8),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).homeBookAgainTitle,
                    style: AppTextStyle.TextSize19,
                  ),
                  const SizedBox(height: 20),
                  const RebookingSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
