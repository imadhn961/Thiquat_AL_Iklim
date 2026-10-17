import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/features/specialistDetail/presentation/view/widgets/specialist_detail_bottom_bar.dart';
import 'package:thiquat_al_iklim/features/specialistDetail/presentation/view/widgets/specialist_detail_view_body.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SpecialistDetailArgs {
  const SpecialistDetailArgs({
    required this.specialist,
    required this.profession,
  });

  final UserModel specialist;
  final String profession;
}

class SpecialistDetailView extends StatelessWidget {
  const SpecialistDetailView({
    super.key,
    required this.specialist,
    required this.profession,
  });

  static const String routeName = '/specialist-detail';

  final UserModel specialist;
  final String profession;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(),
      body: SpecialistDetailViewBody(specialist: specialist),
      bottomNavigationBar: SpecialistDetailBottomBar(specialist: specialist),
    );
  }
}
