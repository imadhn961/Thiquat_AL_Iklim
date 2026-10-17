import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/features/splash/data/splash_repository.dart';
import 'package:thiquat_al_iklim/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:thiquat_al_iklim/features/splash/presentation/view/widgets/splash_view_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(const SplashRepository()),
      child: const Scaffold(
        backgroundColor: Color(0xFF194541),
        body: SplashViewBody(),
      ),
    );
  }
}
