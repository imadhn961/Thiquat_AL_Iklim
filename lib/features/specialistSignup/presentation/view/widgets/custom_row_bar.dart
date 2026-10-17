import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/widgets/custom_sign_up_app_bar.dart';

class customRowBar extends StatelessWidget {
  const customRowBar({super.key, required this.selectIndex});

  final int selectIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(2, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: CustomSignUpAppBar(
              activeColor: index == selectIndex
                  ? AppColor.roleSpecialist
                  : const Color(0xFFECE6DA),
            ),
          ),
        );
      }),
    );
  }
}
