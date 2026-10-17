import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thiquat_al_iklim/core/utils/appAssets.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/bookingPage/presentation/cubit/booking_page_cubit.dart';
import 'package:thiquat_al_iklim/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:thiquat_al_iklim/features/splash/presentation/cubit/splash_state.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().startLoading();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigate) {
          if (state.bookingId != null) {
            context.read<BookingPageCubit>().watchBooking(state.bookingId!);
          }
          Navigator.pushReplacementNamed(
            context,
            state.routeName,
            arguments: state.arguments,
          );
        }
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.assetsImagesThiqatIcon,
                width: 96,
                height: 96,
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).appTitle,
                textAlign: TextAlign.center,
                style: AppTextStyle.TextSize28.copyWith(
                  color: AppColor.background,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                S.of(context).splashTagline,
                textAlign: TextAlign.center,
                style: AppTextStyle.TextSize16.copyWith(
                  color: AppColor.background,
                ),
              ),
              const SizedBox(height: 40),
              BlocBuilder<SplashCubit, SplashState>(
                builder: (context, state) {
                  final progress = state is SplashLoading
                      ? state.progress
                      : null;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: AppColor.background,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColor.roleCTA,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Text(
                S.of(context).splashLoading,
                style: AppTextStyle.TextSize14.copyWith(
                  color: AppColor.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
