import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/common_widgets/custom_doctor_data.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../domain/entities/appointment_entity.dart';

class CancelledOrCompletedWidget extends StatelessWidget {
  final List<AppointmentEntity> appointments;
  final String status;
  final Color colorStatus;
  const CancelledOrCompletedWidget({super.key, required this.appointments, required this.status, required this.colorStatus});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: appointments.length,
        itemBuilder:(context, index) {
          return Column(
            children: [
              CustomDoctorsDataWidget(
                status: status,
                colorStatus: colorStatus,
                showStatus: true,
                showIconMessage: true,
                doctor: appointments[index].doctor,
                day: DateFormat(
                  'EEEE, dd MMM',
                ).format(appointments[index].appointmentDate,),
                time: appointments[index].appointmentTime,

                notShowRate: false,
              ),
              verticalSpace(20),

            ],
          );
        }
    );
  }
}
