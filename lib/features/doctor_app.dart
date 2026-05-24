import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/services/shared_pref/shared_pref_keys.dart';
import '../core/theming/app_theme.dart';
import '../core/utils/app_router/navigator_service.dart';
import '../core/utils/app_router/router_app.dart';
import '../core/utils/app_router/routes.dart';
import '../core/utils/di/injection_container.dart';

class DoctorApp extends StatelessWidget {
  final RouterApp routerApp;
  const DoctorApp({super.key, required this.routerApp});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthCubit>()..getUser(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(context),
        initialRoute:checkIsOnBoarding?Routes.onBoardingScreen:
        isLoggedInUser
            ? Routes.bottonNavScreen
            : Routes.loginScreen ,
        onGenerateRoute: routerApp.generateRoute,
      ),
    );
  }
}
