import 'package:doctor_app/features/book_appointment/presentation/screen/done_appointment/widget/done_appointment_bloc_listener.dart';
import 'package:doctor_app/features/book_appointment/presentation/screen/shared_widget/shared_notification_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../core/constants/app_svgs.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/common_widgets/custom_doctor_data.dart';
import '../../../domain/entities/appointment_params.dart';
import '../../controller/book_appointment_cubit.dart';
import '../shared_widget/booking_information.dart';
import '../shared_widget/custom_texts_appointment.dart';


class DoneAppointmentScreen extends StatelessWidget {
  final AppointmentParams appointmentParams;

  final Widget child;

  final bool showState;
  final Widget listener;

  const DoneAppointmentScreen({
    super.key,

    required this.appointmentParams,

    required this.child,

    required this.showState,
    required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),

              child: Column(
                children: [
                  SvgPicture.asset(AppSvgs.doneIcon),

                  verticalSpace(20),

                  showState
                      ? buildText('Booking Confirmed', context)
                      : buildText('Booking has been rescheduled', context),

                  verticalSpace(40),

                  BookingInformation(appointmentParams: appointmentParams),

                  verticalSpace(20),

                  Align(
                    alignment: Alignment.centerLeft,

                    child: buildText('Doctor Information', context),
                  ),

                  verticalSpace(10),

                  CustomDoctorsDataWidget(doctor: appointmentParams.doctor),

                  verticalSpace(20),

                  showState
                      ? CustomElevatedButton(
                          buttonName: 'Done',

                          onPressed: () async {
                            await context
                                .read<BookAppointmentCubit>()
                                .bookAppointment(appointmentParams);
                            await AppointmentNotificationHelper.showNotification(
                              context: context,
                              appointmentParams: appointmentParams,
                              title1: 'Appointment Confirmed',
                            );
                          },
                        )
                      : child,

                  showState ? const DoneAppointmentBlocListener() : listener,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
