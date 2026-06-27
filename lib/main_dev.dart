import 'package:flutter/material.dart';
import 'core/helpers/supabase_helper.dart';
import 'core/utils/app_router/router_app.dart';
import 'features/doctor_app.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupAbaseHelper.init();
  runApp(DoctorApp(routerApp: RouterApp()));
}


