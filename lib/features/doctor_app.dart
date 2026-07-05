import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/chat/presentation/controller/chat_cubit.dart';
import 'package:doctor_app/features/home/presentation/controller/doctor/doctors_cubit.dart';
import 'package:doctor_app/features/home/presentation/controller/recommendation/recommendation_cubit.dart';
import 'package:doctor_app/features/home/presentation/controller/specialization/specialization_cubit.dart';
import 'package:doctor_app/features/notification/presentation/controller/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/helpers/app_startup_helper.dart';
import '../core/services/notification/local_notification.dart';
import '../core/theming/app_theme.dart';
import '../core/utils/app_router/navigator_service.dart';
import '../core/utils/app_router/router_app.dart';
import '../core/utils/app_router/routes.dart';
import '../core/utils/di/injection_container.dart';
import 'doctor_app/presentation/controller/doctor_cubit.dart';

class DoctorApp extends StatefulWidget {
  final RouterApp routerApp;
  const DoctorApp({super.key, required this.routerApp});

  @override
  State<DoctorApp> createState() => _DoctorAppState();
}

class _DoctorAppState extends State<DoctorApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (LocalNotification.launchPayload != null) {
        navigatorKey.currentState?.pushNamed(Routes.notificationScreen);

        LocalNotification.launchPayload = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrentDoctorCubit()..getDoctorData(),
        ),
        BlocProvider(
          create: (context) => sl<SpecializationCubit>()..getSpecialization(),
        ),
        BlocProvider(create: (context) => sl<DoctorCubit>()..getDoctors()),
        BlocProvider(
          create: (context) => sl<RecommendationCubit>()
            ..getUserLocation()
            ..getDoctors()
            ..getSpecialization(),
        ),
        BlocProvider(create: (context) => sl<NotificationCubit>()),
        BlocProvider(create: (context) => sl<ChatCubit>()..getAllChats()),
        BlocProvider(create: (context) => sl<AuthCubit>()..getUser()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(context),
        initialRoute: AppStartupState.isOnBoardingCompleted
            ? Routes.onBoardingScreen
            : AppStartupState.isLoggedIn
            ? (AppStartupState.isDoctor
                  ? Routes.doctorHomeScreen
                  : Routes.bottonNavScreen)
            : Routes.loginScreen,
        onGenerateRoute: widget.routerApp.generateRoute,
      ),
    );
  }
}
