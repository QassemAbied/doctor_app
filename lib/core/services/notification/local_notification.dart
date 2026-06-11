import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;


class LocalNotification {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void onTap(NotificationResponse notificationResponse) {}
  static Future<void> init() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  static Future showNotification({
    required String title,
    required String body,
  })
  async {
    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          'appointment_channel',

          'Appointments',

          importance: Importance.max,

          priority: Priority.high,
        ),
      ),
    );
  }

  static Future showScheduleNotification({
    required String title,
    required String body,
    required tz.TZDateTime scheduledDate,
    required int id
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id: id,

      title: title,

      body: body,

      scheduledDate:scheduledDate,
      // tz.TZDateTime.now(
      //   tz.local,
      // ).add(const Duration(seconds: 10)),

      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'appointment_channel',
          'Appointments',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),

      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

}
