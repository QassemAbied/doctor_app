import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../features/notification/domain/entity/local_notification_params.dart';
import '../../../features/notification/domain/use_case/add_local_notification_usecase.dart';
import '../../utils/app_router/navigator_service.dart';
import '../../utils/app_router/routes.dart';
import '../../utils/di/injection_container.dart';

class LocalNotification {
  static String? launchPayload;
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //static void onTap(NotificationResponse notificationResponse) {}
  static Future<void> init() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );

    final details = await flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();

    if (details?.didNotificationLaunchApp ?? false) {
      launchPayload = details?.notificationResponse?.payload;
    }
  }

  static Future showNotification({
    required String title,
    required String body,
  }) async {
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
    required int id,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id: id,

      title: title,

      body: body,

      scheduledDate: scheduledDate,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'appointment_channel',
          'Appointments',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      payload: '$title|$body',
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  static Future<void> onTap(NotificationResponse notificationResponse) async {
    final payload = notificationResponse.payload;

    if (payload == null) return;

    final parts = payload.split('|');

    await sl<AddLocalNotificationUseCase>()(
      LocalNotificationParams(title: parts[0], body: parts[1], isRead: false),
    );
    navigatorKey.currentState?.pushNamed(Routes.notificationScreen);
  }
}
