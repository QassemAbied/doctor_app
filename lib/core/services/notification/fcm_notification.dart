import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification.dart';

class FcmNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future init() async {
    await messaging.requestPermission();
    final token = await messaging.getToken();
    log("FCM TOKEN => $token");
    FirebaseMessaging.onBackgroundMessage(handlerBackGround);
    FirebaseMessaging.onMessage.listen(handlerMessage);
  }

  static Future<void> handlerBackGround(RemoteMessage message) async {
    await Firebase.initializeApp();
    log("Handling a background message: ${message.messageId}");
  }

  static Future<void> handlerMessage(RemoteMessage message) async {
    LocalNotification.showNotification(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
    );


    log("Handling a message: ${message.messageId}");

  }
}
