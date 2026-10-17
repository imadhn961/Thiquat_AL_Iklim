import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/features/categoryResult/categoryResult.dart';
import 'package:thiquat_al_iklim/features/home/data/models/category_model.dart';
import 'package:thiquat_al_iklim/features/home/presentation/view/widgets/custom_category_container.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class customGridViewCategory extends StatelessWidget {
  const customGridViewCategory({super.key, this.catNumber});
  final int? catNumber;
  static const List<CategoryModel> categories = CategoryData.categories;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        childAspectRatio: 10 / 14,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: catNumber ?? categories.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    CategoryResultView(categoryModel: categories[index]),
              ),
            );
          },
          child: CustomcategoriesContainer(categoryModel: categories[index]),
        );
      },
    );
  }
}
