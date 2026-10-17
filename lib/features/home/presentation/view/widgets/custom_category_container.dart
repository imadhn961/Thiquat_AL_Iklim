import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/Functions/getLetter.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/home/data/models/category_model.dart';

class CustomcategoriesContainer extends StatelessWidget {
  const CustomcategoriesContainer({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFECE6DA), width: 1),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 40,
            width: 40,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(9),
              ),
              color: categoryModel.color.withValues(alpha: .4),
            ),
            child: Center(
              child: Text(
                getLetter(context, categoryModel.localizedName(context)),
                style: AppTextStyle.TextSize14.copyWith(
                  color: categoryModel.color,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                categoryModel.localizedName(context),
                style: AppTextStyle.TextSize14,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
