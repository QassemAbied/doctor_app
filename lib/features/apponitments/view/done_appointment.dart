import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/features/apponitments/view/widgets/booking_information.dart';
import 'package:doctor_app/features/apponitments/view/widgets/done_appointment_bloc_listener.dart';
import 'package:doctor_app/features/my_appointment/logic/my_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../core/di/dependey.dart';
import '../../../core/theming/app_color.dart';
import '../../../core/theming/app_styles.dart';
import '../../details_doctor/data/models/details_doctors_models.dart';
import '../../details_doctor/view/widgets/doctor_data.dart';
import '../data/models/appointment_request.dart';
import '../logic/appiotment_store_cubit.dart';
import '../logic/appointment_data_cubit.dart';

class DoneAppointmentScreen extends StatelessWidget {
  final DataForDoctors? dataForDoctors;

  const DoneAppointmentScreen({super.key, required this.dataForDoctors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                children: [
                  verticalSpace(20),
                  SvgPicture.asset('assets/svgs/doneIcon.svg'),
                  verticalSpace(20),
                  Text(
                    'Booking Confirmed',
                    style: AppTextStyle.styleBold18(
                      ColorManager.blackColor,
                      context,
                    ),
                  ),
                  verticalSpace(40),
                  BookingInformation(),
                  verticalSpace(40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Doctor Information',
                      style: AppTextStyle.styleSemiBold16(
                        ColorManager.blackColor,
                        context,
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  DoctorsDataWidget(dataForDoctors: dataForDoctors),
                  verticalSpace(100),
                  CustomElevatedButton(
                    buttonName: 'Done',
                    onPressed: () {
                      final state = context.read<AppointmentCubit>().state;

                      final DateTime? selectedDate = state.date;
                      DateTime parsedTime = DateFormat(
                        'hh:mm a',
                      ).parse(state.time!);
                      if (selectedDate != null &&
                          state.time != null &&
                          state.type != null) {
                        DateTime combinedDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          parsedTime.hour,
                          parsedTime.minute,
                        );
                        String formattedDateTime = DateFormat(
                          'yyyy-MM-dd hh.mm a',
                        ).format(combinedDateTime);
                        //BlocProvider.of<AppointmentStoreCubit>(context).emitAppointmentStore(AppointmentRequest(
                        //   dataForDoctors?.id,
                        //   formattedDateTime,
                        // ),)
                        context
                            .read<AppointmentStoreCubit>()
                            .emitAppointmentStore(
                              AppointmentRequest(
                                dataForDoctors?.id,
                                formattedDateTime,
                              ),
                            );
                        if (!context.mounted) return;
                        //  context.read<MyAppointmentCubit>().emitMyAppointment();
                        //getIt<MyAppointmentCubit>().emitMyAppointment();
                        // .then((_) {
                        //  if (!context.mounted) return;
                        //       getIt<MyAppointmentCubit>().emitMyAppointment();
                        //   //context.read<MyAppointmentCubit>().emitMyAppointment();
                        // });
                      }
                    },
                  ),
                  DoneAppointmentBlocListener(dataForDoctors: dataForDoctors),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
