import 'package:flutter/material.dart';
import 'core/di/dependey.dart';
import 'core/services/shared_pref/shared_pref_keys.dart';
import 'core/services/shared_pref/shared_pref_helpers.dart';
import 'core/helpers/supabase_helper.dart';
import 'core/utils/app_router/router_app.dart';
import 'features/doctor_app.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupAbaseHelper.init();
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
