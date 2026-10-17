import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.onchanged,
    required this.typeText,
    this.validator,
    this.prefixText,
    this.isPassword = false,
    this.initialValue,
    this.maxLines,
  });
  final String hintText;
  final void Function(String)? onchanged;
  final TextInputType typeText;
  final String? Function(String?)? validator;
  final String? prefixText;
  final bool isPassword;
  final String? initialValue;
  final int? maxLines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines ?? 1,
      initialValue: widget.initialValue,
      onChanged: widget.onchanged,
      keyboardType: widget.typeText,
      cursorColor: Color(0xFF000000),
      validator: widget.validator,
      cursorHeight: 20,
      obscureText: _obscureText,
      textAlignVertical: TextAlignVertical.center,

      decoration: InputDecoration(
        prefixText: widget.prefixText,
        prefixStyle: AppTextStyle.TextSize16.copyWith(
          color: AppColor.roleClientPrimary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.TextSize16.copyWith(color: Color(0xFF363535)),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF363535),
                ),
                onPressed: () => setState(() => _obscureText = !_obscureText),
              )
            : null,
        enabledBorder: BorderDesign(),
        focusedBorder: BorderDesign(),
        errorBorder: BorderDesign().copyWith(
          borderSide: BorderSide(color: Color(0xFFC0392B), width: 2),
        ),
        focusedErrorBorder: BorderDesign().copyWith(
          borderSide: BorderSide(color: Color(0xFFC0392B), width: 2),
        ),
      ),
    );
  }

  OutlineInputBorder BorderDesign() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(10),
        right: Radius.circular(10),
      ),
      borderSide: BorderSide(color: AppColor.border, width: 2),
    );
  }
}
