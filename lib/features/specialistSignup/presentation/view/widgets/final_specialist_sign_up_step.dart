import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/widgets/Document_Field.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class FinalSpecialistSignUpStep extends StatefulWidget {
  const FinalSpecialistSignUpStep({
    super.key,
    required this.onIdentityAttached,
    required this.onSelfieAttached,
  });

  final ValueChanged<File> onIdentityAttached;
  final ValueChanged<File> onSelfieAttached;

  @override
  State<FinalSpecialistSignUpStep> createState() =>
      _FinalSpecialistSignUpStepState();
}

class _FinalSpecialistSignUpStepState extends State<FinalSpecialistSignUpStep> {
  final ImagePicker _picker = ImagePicker();

  File? _identityImage;
  File? _selfieImage;

  Future<void> _pickIdentityImage(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );
    if (picked == null) return;
    final file = File(picked.path);
    setState(() => _identityImage = file);
    widget.onIdentityAttached(file);
  }

  Future<void> _pickSelfieImage() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );
    if (picked == null) return;
    final file = File(picked.path);
    setState(() => _selfieImage = file);
    widget.onSelfieAttached(file);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).docUploadTitle, style: AppTextStyle.TextSize22),
          const SizedBox(height: 8),
          Text(
            S.of(context).docUploadIntro,
            style: AppTextStyle.TextSize14.copyWith(
              color: AppColor.textSecondary,
            ),
          ),
          const SizedBox(height: 20),
          DocumentField(
            label: S.of(context).docIdLabel,
            attached: _identityImage != null,
            previewFile: _identityImage,
            onTakePhoto: () => _pickIdentityImage(ImageSource.camera),
            onFromGallery: () => _pickIdentityImage(ImageSource.gallery),
          ),
          const SizedBox(height: 16),
          DocumentField(
            label: S.of(context).docSelfieLabel,
            attached: _selfieImage != null,
            previewFile: _selfieImage,
            onTakePhoto: _pickSelfieImage,
            onFromGallery: null,
          ),
        ],
      ),
    );
  }
}
