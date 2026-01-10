import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/core/widgets/app_text_button_widget.dart';
import 'package:doctor_app/features/my_appointment/logic/my_appointment_cubit.dart';
import 'package:doctor_app/features/my_appointment/logic/my_appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependey.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MyAppointmentCubit, MyAppointmentState>(
            builder: (context, state) {
            return  state.maybeWhen(
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
                success: (myAppointmentResponse) {
                  final appointments =
                  myAppointmentResponse.data!.reversed.toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 30,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            //reverse: true,
                            itemCount: appointments.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/images/doctor_image.png',
                                         // width: 90,
                                          //height: 90,
                                        ),
                                      ),
                                      horizontalSpace(20),
                                      Expanded(
                                        flex:3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              appointments[index]
                                                      .doctor
                                                      ?.name ??
                                                  '',
                                              style: AppStyles.styleBold16(
                                                ColorManager.blackColor,
                                                context,
                                              ),
                                            ),
                                            verticalSpace(5),
                                            Text(
                                              '${appointments[index].doctor?.specialization?.name} | ${myAppointmentResponse.data?[index].doctor?.description}',
                                              style: AppStyles.styleMedium14(
                                                ColorManager.geryColor,
                                                context,
                                              ),
                                            ),
                                            verticalSpace(5),

                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  appointments[index].appointmentTime??'',
                                                  style: AppStyles.styleMedium14(
                                                    ColorManager.geryColor,
                                                    context,
                                                  ),
                                                ),
                                              ),

                                            verticalSpace(5),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(8),
                                  Divider(),
                                  verticalSpace(8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 12,
                                            horizontal: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            border: Border.all(
                                              color: ColorManager.blackColor,
                                            ),
                                          ),

                                          child: Center(
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                'Cancel Appointment',
                                                style: AppStyles.styleSemiBold16(
                                                  ColorManager.blackColor,
                                                  context,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // AppTextButtonWidget(
                                      //   colorButton: Colors.white,
                                      //   colorText: ColorManager.blackColor,
                                      //   buttonName: 'Cancel Appointment',
                                      //   onPressed: () {  },
                                      // ),
                                      horizontalSpace(18),
                                      Expanded(
                                        child: AppTextButtonWidget(
                                          buttonName: 'Reschedule',
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(30),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (error) {
                  return Center(child: Text(error));
                },

                orElse: () {
                  return SizedBox.shrink();
                },
              );
            },
          ),
    );
  }
}
