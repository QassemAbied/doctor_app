import 'package:doctor_app/features/book_appointment/domain/entities/appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/utils/di/injection_container.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/common_widgets/custom_doctor_data.dart';
import '../../../controller/book_appointment_cubit.dart';
import '../../reschedule_appointment/reschedule_screen.dart';
import 'all_button.dart';
import 'my_appointment_is_empty.dart';

class UpcomingWidget extends StatelessWidget {
  final List<AppointmentEntity> appointments;

  const UpcomingWidget({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    return appointments.isEmpty
        ? MyAppointmentIsEmpty()
        : ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CustomDoctorsDataWidget(
                    doctor: appointments[index].doctor,
                    day: DateFormat('EEEE, dd MMM').format(
                      DateTime.parse(appointments[index].appointmentDate),
                    ),
                    time: appointments[index].appointmentTime,

                    notShowRate: true,
                  ),
                  verticalSpace(10),
                  Divider(),
                  verticalSpace(10),
                  AllButtonInMyAppointments(
                    id: appointments[index].id,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) =>
                                sl<BookAppointmentCubit>()..setInitialData(
                                  time: appointments[index].appointmentTime,
                                  type: appointments[index].appointmentType,
                                  date: appointments[index].appointmentDate,
                                ),
                            child: RescheduleScreen(
                              dataForDoctors: appointments[index].doctor,
                              id: appointments[index].id,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  verticalSpace(30),
                ],
              );
            },
          );
  }
}
