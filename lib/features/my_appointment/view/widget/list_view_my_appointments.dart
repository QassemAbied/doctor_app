import 'package:flutter/material.dart';
import '../../data/models/my_appointment_response.dart';
import 'item_list_my_appointments.dart';

class ListViewMyAppointments extends StatelessWidget {
  final MyAppointmentResponse? myAppointmentResponse;
  const ListViewMyAppointments({
    super.key,
    required this.myAppointmentResponse,
  });

  @override
  Widget build(BuildContext context) {
    final appointments = myAppointmentResponse?.data!.reversed.toList();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: appointments?.length,
      itemBuilder: (context, index) {
        return ItemListMyAppointments(appointments: appointments?[index]);
      },
    );
  }
}
