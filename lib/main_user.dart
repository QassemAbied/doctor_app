import 'package:doctor_app/core/helpers/constants.dart';
import 'package:doctor_app/core/helpers/shared_pref_helpers.dart';
import 'package:flutter/material.dart';

import 'core/di/dependey.dart';
import 'core/helpers/extension.dart';
import 'core/routing/router_app.dart';
import 'features/doctor_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkLoggedInUser();
  runApp(DoctorApp(routerApp: RouterApp()));


}

Future checkLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );

  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
