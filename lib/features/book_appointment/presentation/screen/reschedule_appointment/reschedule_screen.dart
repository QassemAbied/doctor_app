import 'package:doctor_app/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../core/utils/app_router/routes.dart';
import '../../../../../core/utils/extension.dart';
import '../../../domain/entities/appointment_params.dart';
import '../../controller/book_appointment_cubit.dart';
import '../shared_widget/appointments_date.dart';
import '../shared_widget/shared_notification_appointment.dart';
import 'widget/update_appoimtment_bloc_listener.dart';

class RescheduleScreen extends StatelessWidget {
  final DoctorEntity dataForDoctors;
  final String id;

  const RescheduleScreen({
    super.key,
    required this.dataForDoctors,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reschedule Appointment')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: AppointmentsDate(
          onPressed: () {
            final cubit = context.read<BookAppointmentCubit>();

            final appointmentParams = AppointmentParams(
              doctor: dataForDoctors,

              doctorId: dataForDoctors.id,

              appointmentDate: cubit.selectedDate.toString(),

              appointmentTime: cubit.selectedTime,

              appointmentType: cubit.selectedType.name,

              paymentMethod: cubit.cardType.name,

              price: dataForDoctors.price,

              userId: Supabase.instance.client.auth.currentUser!.id,
            );
            context.pushNamed(
              Routes.doneAppointments,

              arguments: {
                'appointmentParams': appointmentParams,
                'button': CustomElevatedButton(
                  buttonName: 'Done',

                  onPressed: () async {
                    context.read<BookAppointmentCubit>().rescheduleAppointment(
                      RescheduleAppointmentParams(
                        id: id,
                        appointmentDate: appointmentParams.appointmentDate,
                        appointmentTime: appointmentParams.appointmentTime,
                        appointmentType: appointmentParams.appointmentType,
                      ),
                    );
                    await AppointmentNotificationHelper.showNotification(
                      context: context,
                      appointmentParams: appointmentParams,
                      title1: 'Appointment Rescheduled',
                    );
                  },
                ),
                'showState': false,
                'listener': UpdateAppointmentBlocListener(),
                'cubit': context.read<BookAppointmentCubit>(),
              },
            );
          },
        ),
      ),
    );
  }
}
