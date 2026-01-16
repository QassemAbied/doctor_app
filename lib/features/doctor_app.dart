import 'package:doctor_app/core/routing/router_app.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:flutter/material.dart';
import '../core/helpers/constants.dart';
import '../core/routing/routes.dart';

class DoctorApp extends StatelessWidget {
  final RouterApp routerApp;
  const DoctorApp({super.key, required this.routerApp});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorManager.mainBlueColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute:
      isLoggedInUser
          ? Routes.bottonNavScreen
          : Routes.loginScreen,
      onGenerateRoute: routerApp.generateRoute,
    );
  }
}
