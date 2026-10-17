import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.iconPath,
    required this.iconColor,
    required this.label,
    this.onTap,
  });

  final String iconPath;
  final Color iconColor;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.surface,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  textAlign: TextAlign.right,
                  style: AppTextStyle.TextSize17,
                ),
              ),
              Icon(Icons.chevron_left, color: AppColor.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
