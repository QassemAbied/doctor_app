import 'package:doctor_app/features/book_appointment/domain/entities/appointment_entity.dart';
import 'package:flutter/material.dart';
import 'appointment_card_widget.dart';

class AppointmentListWidget extends StatelessWidget {
  final List<AppointmentEntity> appointments;
  final bool showActions;

  const AppointmentListWidget({
    super.key,
    required this.appointments,
    required this.showActions,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: appointments.length,
      itemBuilder: (context, index) {

        return AppointmentCardWidget(appointments: appointments,
          showActions: showActions, index: index,);
      },
    );
  }

}
