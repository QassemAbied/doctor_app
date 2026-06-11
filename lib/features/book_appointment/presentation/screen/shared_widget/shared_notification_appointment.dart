import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timezone/timezone.dart' as tz;
import '../../../../auth/presentation/controller/auth_cubit.dart';
import '../../../../notification/domain/entity/local_notification_params.dart';
import '../../../../notification/presentation/controller/notification_cubit.dart';
import '../../../domain/entities/appointment_params.dart';

class AppointmentNotificationHelper {
  static Future<void> showNotification({
    required BuildContext context,
    required AppointmentParams appointmentParams,
    required String title1,
  }) async {
    final notificationCubit = context.read<NotificationCubit>();

    final authCubit = context.read<AuthCubit>();

    final userName = authCubit.userEntity?.name ?? '';

    await notificationCubit.addShowNotification(
      params: LocalNotificationParams(
        title: title1,

        body:
            'Dear $userName '
            'Your appointment with '
            'Dr. ${appointmentParams.doctor.name} '
            'has been confirmed.',

        isRead: false,
      ),
    );

    final scheduledDate = _generateScheduledDate(appointmentParams);

    await notificationCubit.addScheduleNotification(
      params: LocalNotificationParams(
        title: 'Appointment Reminder',

        body:
            'Dear $userName '
            'Your appointment with '
            'Dr. ${appointmentParams.doctor.name} '
            'starts in 1 hour.',

        isRead: false,
      ),

      scheduledDate: scheduledDate,

      id: DateTime.now().millisecondsSinceEpoch % 2147483647,
    );
  }

  static tz.TZDateTime _generateScheduledDate(
    AppointmentParams appointmentParams,
  ) {
    final parsedDate = DateTime.parse(
      appointmentParams.appointmentDate,
    ).toLocal();

    final date = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

    final time = appointmentParams.appointmentTime;

    final isPm = time.contains('PM');

    final parts = time
        .replaceAll('AM', '')
        .replaceAll('PM', '')
        .trim()
        .split(':');

    int hour = int.parse(parts[0]);

    final minute = int.parse(parts[1]);

    if (isPm && hour != 12) {
      hour += 12;
    }

    if (!isPm && hour == 12) {
      hour = 0;
    }

    final appointmentDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      hour,
      minute,
    );

    return tz.TZDateTime.from(
      appointmentDateTime.subtract(const Duration(hours: 1)),

      tz.local,
    );
  }
}
