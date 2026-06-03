import 'package:doctor_app/features/book_appointment/presentation/screen/done_appointment/widget/done_appointment_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../core/constants/app_svgs.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../details_doctor/presentation/screen/widgets/doctor_data.dart';
import '../../../domain/entities/appointment_params.dart';
import '../../controller/book_appointment_cubit.dart';
import '../book_appointment/widget/booking_information.dart';
import '../book_appointment/widget/custom_texts_appointment.dart';

class DoneAppointmentScreen extends StatelessWidget {
  final AppointmentParams appointmentParams;

  const DoneAppointmentScreen({super.key, required this.appointmentParams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),

              child: Column(
                children: [
                  SvgPicture.asset(AppSvgs.doneIcon),

                  verticalSpace(20),

                  buildText(
                    'Booking Confirmed',
                    context,
                  ),

                  verticalSpace(40),

                  BookingInformation(appointmentParams: appointmentParams),

                  verticalSpace(20),

                  Align(
                    alignment: Alignment.centerLeft,

                    child: buildText('Doctor Information',
                      context
                    ),
                  ),

                  verticalSpace(10),

                  DoctorsDataWidget(doctor: appointmentParams.doctor),

                  verticalSpace(20),

                  CustomElevatedButton(
                    buttonName: 'Done',

                    onPressed: () {
                      context.read<BookAppointmentCubit>().bookAppointment(
                        appointmentParams,
                      );
                    },
                  ),
                  DoneAppointmentBlocListener(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
