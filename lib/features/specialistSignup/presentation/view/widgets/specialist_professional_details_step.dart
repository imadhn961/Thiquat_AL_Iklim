import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/widgets/Custom_text_form_field.dart';
import 'package:thiquat_al_iklim/features/home/data/models/category_model.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

enum SpecialistExperienceRange { oneToThree, threeToTen, overTen }

extension SpecialistExperienceRangeYears on SpecialistExperienceRange {
  int get representativeYears {
    switch (this) {
      case SpecialistExperienceRange.oneToThree:
        return 2;
      case SpecialistExperienceRange.threeToTen:
        return 5;
      case SpecialistExperienceRange.overTen:
        return 11;
    }
  }
}

class SpecialistProfessionalDetailsStep extends StatefulWidget {
  const SpecialistProfessionalDetailsStep({
    super.key,
    required this.onAddressChanged,
    required this.onProfessionalChanged,
    required this.onCategorySelected,
    required this.onExperienceSelected,
    required this.onDescriptionChanged,
  });

  final ValueChanged<String> onAddressChanged;
  final ValueChanged<String> onProfessionalChanged;
  final ValueChanged<String> onCategorySelected;
  final ValueChanged<SpecialistExperienceRange> onExperienceSelected;
  final ValueChanged<String> onDescriptionChanged;

  @override
  State<SpecialistProfessionalDetailsStep> createState() =>
      _SpecialistProfessionalDetailsStepState();
}

class _SpecialistProfessionalDetailsStepState
    extends State<SpecialistProfessionalDetailsStep> {
  SpecialistExperienceRange? _selectedExperience;
  String? _selectedCategoryKey;

  void _selectExperience(SpecialistExperienceRange range) {
    setState(() => _selectedExperience = range);
    widget.onExperienceSelected(range);
  }

  void _selectCategory(String? key) {
    setState(() => _selectedCategoryKey = key);
    if (key != null) {
      widget.onCategorySelected(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).bookingAddressLabel,
            style: AppTextStyle.TextSize16,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            onchanged: widget.onAddressChanged,
            hintText: S.of(context).bookingAddressHint,
            typeText: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).specSignupCategoryLabel,
            style: AppTextStyle.TextSize16,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _selectedCategoryKey,

            decoration: InputDecoration(
              hintText: S.of(context).specSignupCategoryHint,
              hintStyle: AppTextStyle.TextSize14.copyWith(
                color: AppColor.textSecondary,
              ),
              filled: true,
              fillColor: AppColor.surface,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColor.border, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColor.border, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.roleSpecialist,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.statusError,
                  width: 2,
                ),
              ),
            ),
            dropdownColor: AppColor.surface,
            borderRadius: BorderRadius.circular(12),
            style: AppTextStyle.TextSize14.copyWith(
              color: AppColor.textPrimary,
            ),
            items: CategoryData.categories
                .map(
                  (cat) => DropdownMenuItem(
                    value: cat.nameKey,
                    child: Text(cat.localizedName(context)),
                  ),
                )
                .toList(),
            onChanged: _selectCategory,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).professionalDetails,
            style: AppTextStyle.TextSize16,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            onchanged: widget.onProfessionalChanged,
            hintText: S.of(context).professionalhint,
            typeText: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).specSignupExperienceYears,
            style: AppTextStyle.TextSize16,
          ),
          const SizedBox(height: 12),
          Row(
            children: SpecialistExperienceRange.values.map((range) {
              final selected = _selectedExperience == range;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () => _selectExperience(range),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColor.roleSpecialist
                            : AppColor.surface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selected
                              ? AppColor.roleSpecialist
                              : AppColor.border,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        _experienceLabel(context, range),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.TextSize14.copyWith(
                          color: selected
                              ? AppColor.background
                              : AppColor.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).specSignupBioLabel,
            style: AppTextStyle.TextSize16,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            maxLines: 5,
            onchanged: widget.onDescriptionChanged,
            hintText: S.of(context).specSignupBioHint,
            typeText: TextInputType.multiline,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  String _experienceLabel(
    BuildContext context,
    SpecialistExperienceRange range,
  ) {
    switch (range) {
      case SpecialistExperienceRange.oneToThree:
        return S.of(context).exp1To3Years;
      case SpecialistExperienceRange.threeToTen:
        return S.of(context).exp3To10Years;
      case SpecialistExperienceRange.overTen:
        return S.of(context).expOver10Years;
    }
  }
}
