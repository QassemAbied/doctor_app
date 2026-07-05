import 'package:doctor_app/core/services/deep_links_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/helpers/app_startup_helper.dart';
import 'core/services/notification/fcm_notification.dart';
import 'core/services/notification/local_notification.dart';
import 'core/services/supa_base_service/supa_base_auth_service.dart';
import 'core/utils/app_router/router_app.dart';
import 'core/helpers/supabase_helper.dart';
import 'core/utils/di/injection_container.dart';
import 'features/doctor_app.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  tz.initializeTimeZones();

  await SupAbaseHelper.init();
  if (!kIsWeb) {
    await LocalNotification.init();
  }
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  await Stripe.instance.applySettings();
  await init();
  await DeepLinkService().init();
  await AppStartupHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FcmNotificationService.init();
  await SupAbaseAuthService.saveToken();
  runApp(DoctorApp(routerApp: RouterApp()));
}
