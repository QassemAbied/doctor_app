import 'package:doctor_app/core/helpers/extension.dart';
import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/core/widgets/app_text_button_widget.dart';
import 'package:doctor_app/features/apponitments/data/models/appointment_request.dart';
import 'package:doctor_app/features/apponitments/logic/appiotment_store_cubit.dart';
import 'package:doctor_app/features/apponitments/view/widgets/appointment_payment.dart';
import 'package:doctor_app/features/apponitments/view/widgets/appointment_summary.dart';
import 'package:doctor_app/features/apponitments/view/widgets/appointments_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../details_doctor/data/models/details_doctors_models.dart';
import '../../details_doctor/view/widgets/doctor_data.dart';
import '../logic/appointment_data_cubit.dart';
import 'done_appointment.dart';

class AppointmentsScreen extends StatefulWidget {
  final DataForDoctors? dataForDoctors;

  const AppointmentsScreen({super.key, required this.dataForDoctors});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  int currentStepAll = 1;
  final PageController pageController = PageController();
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => AppointmentCubit(),
        child: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      stepperWidget(
                        title: 'Date & Time',
                        step: 1,
                        // isActive: isActive,
                        context: context,
                      ),
                      horizontalSpace(10),
                      buildDivider(1),
                      horizontalSpace(10),
                      stepperWidget(
                        title: 'Payment',
                        step: 2,
                        // isActive: isActive,
                        context: context,
                      ),
                      horizontalSpace(10),
                      buildDivider(2),
                      horizontalSpace(10),
                      stepperWidget(
                        title: 'Summary',
                        step: 3,
                        // isActive: isActive,
                        context: context,
                      ),
                    ],
                  ),
                  verticalSpace(20.0),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentStepAll = index + 1;
                          isActive = true;
                        });
                      },
                      children: [
                        AppointmentsDate(),
                        AppointmentPayments(),
                        AppointmentSummary(
                          dataForDoctors: widget.dataForDoctors,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      currentStepAll == 1
                          ? SizedBox.shrink()
                          : Expanded(
                              child: AppTextButtonWidget(
                                onPressed: () {
                                  pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                buttonName: 'Back',
                              ),
                            ),
                      horizontalSpace(10),
                      Expanded(
                        flex: 2,
                        child: AppTextButtonWidget(
                          buttonName: currentStepAll == 3
                              ? 'Finish'
                              : 'Continue',

                          onPressed: () {
                            final state = context
                                .read<AppointmentCubit>()
                                .state;

                            final DateTime? selectedDate = state.date;
                            if (selectedDate != null &&
                                state.time != null &&
                                state.type != null) {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );

                              if (currentStepAll == 3) {
                                if (!context.mounted) return;
                                //  context.pushNamed(
                                //   '/doneAppointments',
                                //   arguments: widget.dataForDoctors,
                                // );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MultiBlocProvider(
                                      providers: [
                                        BlocProvider.value(
                                          value: context
                                              .read<AppointmentCubit>(),
                                        ),
                                        BlocProvider.value(
                                          value: context
                                              .read<AppointmentStoreCubit>(),
                                        ),
                                      ],
                                      child: DoneAppointmentScreen(
                                        dataForDoctors: widget.dataForDoctors,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                SizedBox.shrink();
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please complete all steps'),
                                ),
                              );
                            }
                            //   pageController.jumpToPage(currentStepAll);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column stepperWidget({
    required String title,
    required int step,
    //  required bool isActive,
    required BuildContext context,
  }) {
    final isActive = step <= currentStepAll;
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isActive
                ? ColorManager.mainBlueColor
                : ColorManager.lightGeryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              step.toString(),
              style: AppStyles.styleMedium14(Colors.white, context),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: AppStyles.styleRegular14(
            isActive ? ColorManager.blackColor : ColorManager.lightGeryColor,
            context,
          ),
        ),
      ],
    );
  }

  Expanded buildDivider(int step) {
    final isActive = step <= currentStepAll;
    return Expanded(
      child: Container(
        height: 2,
        color: isActive
            ? ColorManager.mainBlueColor
            : ColorManager.lightGeryColor,
      ),
    );
  }
}
