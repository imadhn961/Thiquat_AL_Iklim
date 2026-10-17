import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thiquat_al_iklim/core/routing/Route.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/features/bookingPage/bookingPage.dart';
import 'package:thiquat_al_iklim/features/splash/presentation/view/splash_screen.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingPageCubit(BookingPageRepositoryImpl()),
      child: MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: AppRouter.generateRoute,
        title: 'ثقة الإقليم',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: AppColor.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.background,
            surfaceTintColor: Colors.transparent,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
