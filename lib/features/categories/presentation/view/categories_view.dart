import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/features/home/presentation/view/widgets/custom_grid_view_category.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  static const String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).categoriesTitle)),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: customGridViewCategory(),
      ),
    );
  }
}
