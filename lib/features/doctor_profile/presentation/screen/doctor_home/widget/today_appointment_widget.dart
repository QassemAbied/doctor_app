import 'package:doctor_app/core/common_widgets/custom_image_or_name_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../book_appointment/domain/entities/appointment_entity.dart';

class TodayAppointmentsSection extends StatelessWidget {
  final List<AppointmentEntity> appointment;

  const TodayAppointmentsSection({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final appointments = appointment
        .where((e) => e.status.name == 'upcoming')
        .toList();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today Appointments',
            style: AppTextStyle.styleBold18(ColorManager.textPrimary, context),
          ),

          verticalSpace(16),

          if (appointments.isEmpty)
            const Center(child: Text('No Appointments'))
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];

                return AppointmentItem(
                  patientName: appointment.user?.name ?? 'Patient',
                  time: appointment.appointmentTime,
                  name: appointment.user?.name ?? '',
                  image: appointment.user?.image ?? '',
                );
              },
              separatorBuilder: (_, _) => verticalSpace(15),
            ),
        ],
      ),
    );
  }
}

class AppointmentItem extends StatelessWidget {
  final String patientName;
  final String time;
  final String name;
  final String image;

  const AppointmentItem({
    super.key,
    required this.patientName,
    required this.time,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageOrNameWidget(radius: 22, name: name, image: image),

        horizontalSpace(12),

        Expanded(
          child: Text(
            patientName,
            style: AppTextStyle.styleMedium16(
              ColorManager.textPrimary,
              context,
            ),
          ),
        ),

        Text(
          time,
          style: AppTextStyle.styleRegular14(
            ColorManager.textSecondary,
            context,
          ),
        ),
      ],
    );
  }
}
