import 'package:device_preview/device_preview.dart';
import 'package:doctor_app/core/services/shared_pref/shared_pref_keys.dart';
import 'package:doctor_app/core/services/shared_pref/shared_pref_helpers.dart';
import 'package:doctor_app/core/services/deep_links_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/services/notification/local_notification.dart';
import 'core/utils/app_router/router_app.dart';
import 'core/utils/extension.dart';
import 'core/helpers/supabase_helper.dart';
import 'core/utils/di/injection_container.dart';
import 'features/doctor_app.dart';
import 'package:timezone/data/latest.dart' as tz;

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
  await checkLoggedInUser();
  await isOnBoarding();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,

      builder: (context) => DoctorApp(routerApp: RouterApp()),
    ),
  );
}

Future isOnBoarding() async {
  bool? isOnBoarding = await SharedPrefHelper.getBool(
    SharedPrefKeys.isOnBoarding,
  );
  if (isOnBoarding == true) {
    checkIsOnBoarding = false;
  } else {
    checkIsOnBoarding = true;
  }
}

Future checkLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getString(SharedPrefKeys.userId);

  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
