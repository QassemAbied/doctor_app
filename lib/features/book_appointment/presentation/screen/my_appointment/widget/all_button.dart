import 'package:doctor_app/features/book_appointment/presentation/controller/book_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../notification/domain/entity/local_notification_params.dart';
import '../../../../../notification/presentation/controller/notification_cubit.dart';
import '../../../../domain/entities/appointment_entity.dart';

class AllButtonInMyAppointments extends StatelessWidget {
  final String id;
  final VoidCallback onPressed;
  final AppointmentEntity appointments;
  const AllButtonInMyAppointments({
    super.key,
    required this.id,
    required this.onPressed, required this.appointments,
  });

  @override
  Widget build(BuildContext context) {
    final notificationCubit = context.read<NotificationCubit>();
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: ()async {
              context.read<BookAppointmentCubit>().cancelAppointment(id);
              await notificationCubit.addShowNotification(
                params: LocalNotificationParams(
                  title: 'New appointment with Cancel',
                  body:
                  'Dear ${appointments.doctor.name} '
                      '${appointments.user?.name??''} Cancel an appointment with you',
                  isRead: false,
                  id: appointments.doctor.userId??"",
                ),
                doctorUserId:appointments.doctor.userId??"",
              );
            },
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('Cancel Appointment'),
            ),
          ),
        ),
        horizontalSpace(18),
        Expanded(
          child: CustomElevatedButton(
            buttonName: 'Reschedule',
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
