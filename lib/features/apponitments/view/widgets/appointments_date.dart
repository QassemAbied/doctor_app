import 'package:doctor_app/features/apponitments/logic/appointment_data_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class AppointmentsDate extends StatelessWidget {
   AppointmentsDate({super.key});

  List<DateTime> showDate() {
    final now = DateTime.now();
    return List.generate(30, (i) => now.add(Duration(days: i)));
  }

  final List<String> timeAppointments = [
    '08:00 AM',
    '08:30 AM',
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '11:00 AM',
  ];

//  AppointmentsType selectedType = AppointmentsType.inPerson;

  @override
  Widget build(BuildContext context) {
    final selectedType = context.watch<AppointmentCubit>().state.type;
    List<DateTime> date = showDate();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Date',
                style: AppTextStyle.styleSemiBold16(
                  ColorManager.blackColor,
                  context,
                ),
              ),
              verticalSpace(20),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.09,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: date.length,
                  itemBuilder: (context, index) {
                   // final isSelected = selectDate == index;
                    final state = context.watch<AppointmentCubit>().state;
                    final isSelected =
                       // (state.date == null && index == 0) ||
                            (state.date != null &&
                                DateUtils.isSameDay(state.date, date[index]));
                    return GestureDetector(
                      onTap: () {
                        context.read<AppointmentCubit>().selectDate(
                          date[index],
                        );

                      },
                      child: Transform.scale(
                        scale: isSelected ? 1.20 : 1.0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,

                          margin: EdgeInsets.only(right: 15.0),
                          padding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 14,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: isSelected
                                ? ColorManager.primaryColor
                                : ColorManager.grey40,
                          ),
                          child: Column(
                            children: [
                              Text(
                                DateFormat('EEE').format(date[index]),
                                style: AppTextStyle.styleBold18(
                                  Colors.white,
                                  context,
                                ),
                              ),
                              Text(
                                DateFormat('dd').format(date[index]),
                                style: AppTextStyle.styleBold18(
                                  Colors.white,
                                  context,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              verticalSpace(20),
              Text(
                'Available time',
                style: AppTextStyle.styleSemiBold16(
                  ColorManager.blackColor,
                  context,
                ),
              ),
              verticalSpace(20),
            ],
          ),
        ),
        // GridView.count(
        //   shrinkWrap: true,
        //   physics: NeverScrollableScrollPhysics(),
        //   scrollDirection: Axis.vertical,
        //   crossAxisCount: 2,
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 10,
        //   childAspectRatio: 25 / 9,
        //   children: List.generate(6, (index) {
        //     final isSelected = selectTime == index;
        //     return GestureDetector(
        //       onTap: () {
        //         setState(() {
        //           selectTime = index;
        //         });
        //       },
        //       child: Container(
        //         height: 50,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(12.0),
        //           color: isSelected
        //               ? ColorManager.mainBlueColor
        //               : ColorManager.lightGeryColor,
        //         ),
        //         child: Center(
        //           child: Text(
        //             timeAppointments[index],
        //             style: AppStyles.styleMedium16(
        //               Colors.white,
        //               context,
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   }),
        // ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
           // final isSelected = selectTime == index;
            final isSelected =
                context.watch<AppointmentCubit>().state.time ==
                    timeAppointments[index];
            return GestureDetector(
              onTap: () {
                context.read<AppointmentCubit>().selectTime(
                  timeAppointments[index],
                );
                // context.read<AppointmentCubit>().selectTime(
                //   timeAppointments[index],
                // );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: isSelected
                      ? ColorManager.primaryColor
                      : ColorManager.grey30,
                ),
                child: Center(
                  child: Text(
                    timeAppointments[index],
                    style: AppTextStyle.styleMedium16(Colors.white, context),
                  ),
                ),
              ),
            );
          }, childCount: timeAppointments.length),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 25 / 9,
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              verticalSpace(20),
              Text(
                'Appointment Type',
                style: AppTextStyle.styleSemiBold16(
                  ColorManager.blackColor,
                  context,
                ),
              ),
              verticalSpace(20),
              Column(
                children: <Widget>[

                  buildRadio(
                    context: context,
                    image: 'assets/images/personal.png',
                    title: 'In Person',
                    value: AppointmentsType.inPerson,
                    groupValue: selectedType,
                    onChange: () {
                      context.read<AppointmentCubit>().selectType(
                          AppointmentsType.inPerson);
                      // setState(() {
                      //   selectedType = AppointmentsType.inPerson;
                      // });
                    },
                  ),
                  verticalSpace(5),
                  Divider(),
                  verticalSpace(5),
                  buildRadio(
                    context: context,
                    image: 'assets/images/video.png',
                    title: 'Video Call',
                    value: AppointmentsType.videoCall,
                    groupValue: selectedType,
                    onChange: () {
                      context.read<AppointmentCubit>().selectType(
                          AppointmentsType.videoCall);
                      // setState(() {
                      //   selectedType = AppointmentsType.videoCall;
                      // });
                    },
                  ),
                  verticalSpace(5),
                  Divider(),
                  verticalSpace(5),
                  buildRadio(
                    context: context,
                    image: 'assets/images/call.png',
                    title: 'Phone Call',
                    value: AppointmentsType.phoneCall,
                    groupValue: selectedType,
                    onChange: () {
                      context.read<AppointmentCubit>().selectType(
                          AppointmentsType.phoneCall);
                      // setState(() {
                      //   selectedType = AppointmentsType.phoneCall;
                      // });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildRadio({
    required BuildContext context,
    required String image,
    required String title,
    required var value,
    required var groupValue,
    required VoidCallback onChange,
  }) {
    return Row(
      children: [
        Image.asset(image, height: 50, width: 50),
        horizontalSpace(15),
        Text(
          title,
          style: AppTextStyle.styleMedium14(ColorManager.blackColor, context),
        ),
        Expanded(child: SizedBox.shrink()),
        Theme(
          data: Theme.of(context).copyWith(
            radioTheme: RadioThemeData(
              fillColor: WidgetStateProperty.all(ColorManager.primaryColor),
            ),
          ),
          child: RadioMenuButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(ColorManager.primaryColor),
            ),
            value: value,
            groupValue: groupValue,
            onChanged: (_) {
              return onChange();
            },
            child: null,
          ),
        ),
      ],
    );
  }
}

enum AppointmentsType { inPerson, videoCall, phoneCall }
