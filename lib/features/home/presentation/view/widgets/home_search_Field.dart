import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/features/search/presentation/view/search_view.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, SearchView.routeName),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: AbsorbPointer(
                child: TextField(
                  enabled: false,
                  cursorColor: Color(0xFF000000),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hint: Text(S.of(context).homeSearchHint),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColor.roleClientBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search,
                size: 18,
                color: AppColor.roleClientPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
