import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/features/book_appointment/presentation/screen/book_appointment/widget/appointment_payment.dart';
import 'package:doctor_app/features/book_appointment/presentation/screen/book_appointment/widget/appointment_summary.dart';
import 'package:doctor_app/features/book_appointment/presentation/screen/shared_widget/appointments_date.dart';
import 'package:doctor_app/features/book_appointment/presentation/screen/book_appointment/widget/stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/domain/entities/doctor_entity.dart';
import '../../controller/book_appointment_cubit.dart';

class BookAppointmentScreen extends StatelessWidget {
  final DoctorEntity? dataForDoctors;
  const BookAppointmentScreen({super.key, this.dataForDoctors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StepperWidget(),
            verticalSpace(20),
            Expanded(
              child: PageView(
                controller: context.read<BookAppointmentCubit>().pageController,
                onPageChanged: (value) {
                  context.read<BookAppointmentCubit>().selectTapBar(value);
                },
                physics: BouncingScrollPhysics(),
                children: [
                  AppointmentsDate(
                    onPressed: () {
                      context.read<BookAppointmentCubit>().selectTapBar(1);
                    },
                  ),
                  AppointmentPayments(dataForDoctors: dataForDoctors,),
                  AppointmentSummary(dataForDoctors: dataForDoctors),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
