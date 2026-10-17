import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/appAssets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/widgets/Custom_text_form_field.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_arrow_back_widget.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_button.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_or_widget.dart';
import 'package:thiquat_al_iklim/features/Main/presentation/view/main_view.dart';
import 'package:thiquat_al_iklim/features/SpecialistMain/presentation/view/Sepcialist_main_view.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/cubit/login_cubit.dart';
import 'package:thiquat_al_iklim/shared/auth/presentation/cubit/login_state.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String _email = '';
  String _password = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().loginWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).authLoginSuccess)),
          );
          if (state.user.role == UserRole.specialist) {
            Navigator.pushReplacementNamed(
              context,
              SpecialistMainView.routeName,
            );
          } else {
            Navigator.pushReplacementNamed(context, MainView.routeName);
          }
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;
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
                Text(
                  S.of(context).authLoginTitle,
                  style: AppTextStyle.TextSize28,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).authLoginSubtitle,
                  style: AppTextStyle.TextSize14,
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
                GestureDetector(
                  onTap: isLoading ? null : _submit,
                  child: isLoading
                      ? SizedBox(
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColor.roleCTA,
                            ),
                          ),
                        )
                      : CustomButton(
                          authSendOtp2: S.of(context).login,
                          color: AppColor.roleCTA,
                        ),
                ),
                const SizedBox(height: 20),
                const CustomOrWidget(),
                const SizedBox(height: 20),
                // ?Platform.isAndroid
                //     ? GestureDetector(
                //         onTap: isLoading
                //             ? null
                //             : () =>
                //                   context.read<LoginCubit>().loginWithGoogle(),
                //         child: CustomSocialLogin(
                //           backgroundColor: AppColor.surface,
                //           iconPath: Assets.assetsImagesGoogleIcon,
                //           text: S.of(context).GoogleLogin,
                //           textColor: const Color(0xFF000000),
                //         ),
                //       )
                //     : null,
                // const SizedBox(height: 20),
                // ?Platform.isIOS
                //     ? GestureDetector(
                //         onTap: isLoading
                //             ? null
                //             : () => context.read<LoginCubit>().loginWithApple(),
                //         child: CustomSocialLogin(
                //           backgroundColor: const Color(0xFF000000),
                //           iconPath: Assets.assetsImagesAppleWhiteIcon,
                //           text: S.of(context).AppleLogin,
                //           textColor: const Color(0xFFFFFFFF),
                //         ),
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
