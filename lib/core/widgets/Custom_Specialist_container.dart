import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/Functions/getLetter.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/SpecialistAuth/SpecialistAuth.dart';
import 'package:thiquat_al_iklim/features/specialistDetail/specialistDetail.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class CustomSpecialistContainer extends StatelessWidget {
  const CustomSpecialistContainer({
    super.key,
    required this.user,
    required this.rebooking,
  });
  final UserModel user;
  final bool rebooking;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.pushNamed(
          context,
          SpecialistDetailView.routeName,
          arguments: SpecialistDetailArgs(
            specialist: user,
            profession: user.specialization!,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFECE6DA), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.roleClientPrimary,
                child: Text(
                  getLetter(context, user.name),
                  style: AppTextStyle.TextSize19.copyWith(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: AppTextStyle.TextSize19),
                  const SizedBox(height: 5),
                  Text(
                    " ${user.specialization!}\t${user.rating ?? 0}⭐ ",
                    style: AppTextStyle.TextSize16,
                  ),
                ],
              ),
              const SizedBox(width: 15),
              ?rebooking
                  ? Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.statusSuccess.withValues(alpha: .5),
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              S.of(context).BookAgin,
                              style: AppTextStyle.TextSize19,
                            ),
                          ),
                        ),
                      ),
                    )
                  : null,
            ],
          ),
        ),
      ),
    );
  }
}
