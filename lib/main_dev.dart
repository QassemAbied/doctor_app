import 'package:flutter/material.dart';

import 'core/di/dependey.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helpers.dart';
import 'core/routing/router_app.dart';
import 'features/doctor_app.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkLoggedInUser();
  runApp(DoctorApp(routerApp: RouterApp()));
}

Future checkLoggedInUser()async{
  String? userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken);

  if(  userToken==''&& userToken.isNotEmpty){
    isLoggedInUser=true;
  }else{
    isLoggedInUser=false;
  }
}
