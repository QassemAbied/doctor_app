import 'package:doctor_app/features/book_appointment/domain/entities/appointment_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/utils/spacing.dart';


class AppointmentHistoryWidget extends StatelessWidget {
  final List<AppointmentEntity> appointments;
  const AppointmentHistoryWidget({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:appointments
          .map((appointment) => _AppointmentHistoryCard(appointment))
          .toList(),
    );
  }
}

class _AppointmentHistoryCard extends StatelessWidget {
  final AppointmentEntity appointment;

  const _AppointmentHistoryCard(this.appointment);

  @override
  Widget build(BuildContext context) {
    final status = appointment.status;

    Color color;

    switch (status.name) {
      case 'completed':
        color = Colors.green;
        break;

      case 'cancelled':
        color = Colors.red;
        break;

      default:
        color = ColorManager.primaryColor;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.appointmentDate.toString().split(' ').first,
                ),

                verticalSpace(4),

                Text('${appointment.price} EGP'),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status.name,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
