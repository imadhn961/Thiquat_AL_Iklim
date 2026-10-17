import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/Functions/launchPhoneCall.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/booking/booking.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/enums/verification_status.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SpecialistDetailBottomBar extends StatelessWidget {
  const SpecialistDetailBottomBar({super.key, required this.specialist});

  final UserModel specialist;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.roleCTA,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                specialist.verificationStatus == VerificationStatus.approved
                    ? Navigator.pushNamed(
                        context,
                        BookingView.routeName,
                        arguments: specialist.uid,
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(S.of(context).profileNotVerified),
                        ),
                      );
              },
              child: Text(
                S.of(context).profileBookNow,
                style: AppTextStyle.TextSize19.copyWith(
                  color: AppColor.surface,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () async {
                if (specialist.verificationStatus !=
                    VerificationStatus.approved) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).profileNotcallVerified),
                    ),
                  );
                } else {
                  final launched = await launchPhoneCall(
                    specialist.phoneNumber,
                  );
                  if (!launched && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(S.of(context).profileCallFailed)),
                    );
                  }
                }
              },
              icon: const Icon(Icons.call_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
