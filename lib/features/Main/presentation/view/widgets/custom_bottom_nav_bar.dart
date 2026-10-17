import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thiquat_al_iklim/core/utils/appAssets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final items = [
      (icon: Assets.assetsImagesHome, label: S.of(context).navHome),
      (icon: Assets.assetsImagesCalendar, label: S.of(context).navBookings),
      (icon: Assets.assetsImagesPerson, label: S.of(context).navProfile),
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColor.surface,
        border: Border(top: BorderSide(color: AppColor.border)),
      ),
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: items.asMap().entries.map((e) {
              var item = e.value;
              int index = e.key;
              return Expanded(
                child: _NavBarItem(
                  iconPath: item.icon,
                  label: item.label,
                  selected: index == currentIndex,
                  onTap: () {
                    onTap(index);
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.iconPath,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String iconPath;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? AppColor.roleClientPrimary
        : AppColor.textSecondary;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: AppTextStyle.TextSize14.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
