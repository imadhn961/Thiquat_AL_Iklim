import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thiquat_al_iklim/core/utils/appAssets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.phoneNumber,
  });

  final String name;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColor.roleClientPrimary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.right,
                      style: AppTextStyle.TextSize22.copyWith(
                        color: AppColor.surface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        phoneNumber,
                        textAlign: TextAlign.right,
                        style: AppTextStyle.TextSize16.copyWith(
                          color: AppColor.surface.withValues(alpha: 0.85),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColor.surface,
                child: SvgPicture.asset(
                  Assets.assetsImagesPerson,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColor.roleClientPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
