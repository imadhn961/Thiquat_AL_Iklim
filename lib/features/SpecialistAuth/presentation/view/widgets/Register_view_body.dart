import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/appAssets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/widgets/Custom_text_form_field.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_arrow_back_widget.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_button.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_or_widget.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_social_login.dart';
import 'package:thiquat_al_iklim/core/widgets/header_user_account.dart';
import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/Specialist_SignUp_view.dart';
//import 'package:thiquat_al_iklim/features/specialistSignup/presentation/view/specialist_signup_screen.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/cubit/register_cubit.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/cubit/register_state.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/view/login_view.dart';

class RegisterSpecialistBody extends StatefulWidget {
  const RegisterSpecialistBody();

  @override
  State<RegisterSpecialistBody> createState() => _RegisterSpecialistBodyState();
}

const _lebanonCountryCode = '+961';

class _RegisterSpecialistBodyState extends State<RegisterSpecialistBody> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';

  String get _formattedPhoneNumber {
    final digitsOnly = _phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    final withoutLeadingZero = digitsOnly.startsWith('0')
        ? digitsOnly.substring(1)
        : digitsOnly;
    return '$_lebanonCountryCode$withoutLeadingZero';
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterCubit>().registerWithEmailAndPassword(
        name: _name,
        email: _email,
        password: _password,
        phoneNumber: _formattedPhoneNumber,
      );
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).authRegisterSuccess),
              duration: Duration(seconds: 1),
            ),
          );
          Future.delayed(const Duration(seconds: 1), () {
            if (!mounted) return;
            Navigator.pushReplacementNamed(
              // ignore: use_build_context_synchronously
              context,
              SpecialistSignupView.routeName,
              arguments: state.user,
            );
          });
        }
      },
      builder: (context, state) {
        final isLoading = state is RegisterLoading;
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CustomArrowBackWidget(),
                ),
                const SizedBox(height: 20),
                HeaderUserAccount(
                  title: S.of(context).SpecialistTitle,
                  color: AppColor.roleSpecialist,
                ),
                const SizedBox(height: 20),
                Text(S.of(context).register, style: AppTextStyle.TextSize28),
                const SizedBox(height: 20),
                Text(
                  S.of(context).registerHint,
                  style: AppTextStyle.TextSize14,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).LabelTextForName,
                  style: AppTextStyle.TextSize16,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  onchanged: (value) => _name = value,
                  hintText: S.of(context).UserLoginHitn,
                  typeText: TextInputType.name,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).emailLabelTextForEmail,
                  style: AppTextStyle.TextSize16,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      return "الرجاء إدخال بريد إلكتروني صالح";
                    }
                    return null;
                  },
                  onchanged: (value) => _email = value,
                  hintText: S.of(context).emailLabelTextHint,
                  typeText: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).PasswordLabelTextForPassword,
                  style: AppTextStyle.TextSize16,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    final passwordRegex = RegExp(r'^.{6,}$');
                    if (!passwordRegex.hasMatch(value)) {
                      return "الرجاء إدخال كلمة مرور صالحة (6 أحرف على الأقل)";
                    }
                    return null;
                  },
                  onchanged: (value) => _password = value,
                  hintText: S.of(context).PasswordLabelTextHint,
                  typeText: TextInputType.emailAddress,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).authPhoneLabel,
                  style: AppTextStyle.TextSize16,
                ),
                const SizedBox(height: 20),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      final phoneRegex = RegExp(r'^\d{8}$');
                      if (!phoneRegex.hasMatch(value)) {
                        return "الرجاء إدخال رقم هاتف صالح (8 أرقام)";
                      }
                      return null;
                    },
                    onchanged: (value) => _phoneNumber = value,
                    prefixText: '$_lebanonCountryCode ',
                    hintText: S.of(context).authPhoneHint,
                    typeText: TextInputType.number,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: isLoading ? null : _submit,
                  child: isLoading
                      ? const SizedBox(
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColor.roleSpecialist,
                            ),
                          ),
                        )
                      : CustomButton(
                          authSendOtp2: S.of(context).register,
                          color: AppColor.roleSpecialist,
                        ),
                ),
                const SizedBox(height: 20),
                // const CustomOrWidget(),
                // SizedBox(height: 20),
                // ?Platform.isAndroid
                //     ? Column(
                //         children: [
                //           GestureDetector(
                //             onTap: isLoading
                //                 ? null
                //                 : () => context
                //                       .read<RegisterCubit>()
                //                       .registerWithGoogle(),
                //             child: CustomSocialLogin(
                //               backgroundColor: AppColor.surface,
                //               iconPath: Assets.assetsImagesGoogleIcon,
                //               text: S.of(context).GoogleLogin,
                //               textColor: const Color(0xFF000000),
                //             ),
                //           ),
                //           const SizedBox(height: 20),
                //         ],
                //       )
                //     : null,

                // ?Platform.isIOS
                //     ? Column(
                //         children: [
                //           GestureDetector(
                //             onTap: isLoading
                //                 ? null
                //                 : () => context
                //                       .read<RegisterCubit>()
                //                       .registerWithApple(),
                //             child: CustomSocialLogin(
                //               backgroundColor: const Color(0xFF000000),
                //               iconPath: Assets.assetsImagesAppleWhiteIcon,
                //               text: S.of(context).AppleLogin,
                //               textColor: const Color(0xFFFFFFFF),
                //             ),
                //           ),
                //           const SizedBox(height: 20),
                //         ],
                //       )
                //     : null,

                // const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}
