import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/home/presentation/view/widgets/home_search_Field.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.roleClientPrimary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).homeGreeting,
                style: AppTextStyle.TextSize16.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 14),
              Text(
                S.of(context).homeQuestion,
                style: AppTextStyle.TextSize22.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 14),
              HomeSearchField(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
