import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/appAssets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/help/presentation/view/help_view.dart';
import 'package:thiquat_al_iklim/features/previousBookings/presentation/view/previous_bookings_view.dart';
import 'package:thiquat_al_iklim/features/profile/presentation/view/widgets/profile_header_card.dart';
import 'package:thiquat_al_iklim/features/profile/presentation/view/widgets/profile_menu_item.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.user, this.onLogoutTap});

  final UserModel user;
  final VoidCallback? onLogoutTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeaderCard(name: user.name, phoneNumber: user.phoneNumber),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            children: [
              ProfileMenuItem(
                iconPath: Assets.assetsImagesCalendar,
                iconColor: AppColor.roleManager,
                label: S.of(context).menuPastBookings,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PreviousBookingsView.routeName,
                    arguments: user.uid,
                  );
                },
              ),
              const SizedBox(height: 12),
              ProfileMenuItem(
                iconPath: Assets.assetsImagesChat,
                iconColor: AppColor.catTutor,
                label: S.of(context).menuHelpSupport,
                onTap: () {
                  Navigator.pushNamed(context, HelpView.routeName);
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: onLogoutTap,
                  child: Text(
                    S.of(context).logout,
                    style: AppTextStyle.TextSize17.copyWith(
                      color: AppColor.statusError,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
