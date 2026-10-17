import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class DocumentField extends StatelessWidget {
  const DocumentField({
    required this.label,
    required this.attached,
    required this.onTakePhoto,
    required this.onFromGallery,
    this.previewFile,
  });

  final String label;
  final bool attached;
  final File? previewFile;
  final VoidCallback onTakePhoto;
  final VoidCallback? onFromGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.border, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(label, style: AppTextStyle.TextSize17)),
              if (attached)
                Text(
                  S.of(context).docUploadDone,
                  style: AppTextStyle.TextSize14.copyWith(
                    color: AppColor.statusSuccess,
                  ),
                ),
            ],
          ),
          if (previewFile != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                previewFile!,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onTakePhoto,
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: Text(S.of(context).docUploadTakePhoto),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColor.textPrimary,
                    side: const BorderSide(color: AppColor.border, width: 2),
                  ),
                ),
              ),
              if (onFromGallery != null) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onFromGallery,
                    icon: const Icon(Icons.photo_library_outlined),
                    label: Text(S.of(context).docUploadFromGallery),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColor.textPrimary,
                      side: const BorderSide(color: AppColor.border, width: 2),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
