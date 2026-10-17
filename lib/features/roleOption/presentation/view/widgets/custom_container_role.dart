import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';

class CustomContainerRole extends StatelessWidget {
  const CustomContainerRole({
    super.key,
    required this.color,
    required this.roleTitle,
    required this.roleSubTitle,
    required this.iconPath,
    required this.iconColor,
  });
  final Color color;
  final String roleTitle;
  final String roleSubTitle;
  final String iconPath;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              SizedBox(
                height: 56,
                width: 56,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    // The srcIn colorFilter forces an offscreen saveLayer
                    // compositing pass. Without this boundary, the Material 3
                    // zoom page-transition re-runs that pass on every
                    // animation frame while this page scales/fades in,
                    // which is what shows up as raster jank during nav.
                    // RepaintBoundary lets the engine cache it as one texture.
                    child: RepaintBoundary(
                      child: SvgPicture.asset(
                        iconPath,
                        width: 20,
                        height: 20,
                        // colorFilter: ColorFilter.mode(
                        //   iconColor,
                        //   BlendMode.srcIn,
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(roleTitle, style: AppTextStyle.TextSize22),
                    const SizedBox(height: 10),
                    Text(roleSubTitle, style: AppTextStyle.TextSize16),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.arrow_forward_ios, size: 10),
            ],
          ),
        ),
      ),
    );
  }
}
