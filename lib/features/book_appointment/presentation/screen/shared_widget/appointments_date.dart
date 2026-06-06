import 'package:doctor_app/core/common_widgets/custom_elevated_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/eunm.dart';
import '../../../../../core/utils/spacing.dart';
import '../../controller/book_appointment_cubit.dart';
import '../../controller/book_appointment_state.dart';
import 'custom_texts_appointment.dart';

class AppointmentsDate extends StatelessWidget {
  final VoidCallback onPressed;
  const AppointmentsDate({super.key, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    List<DateTime> date = context.read<BookAppointmentCubit>().showDate();
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<BookAppointmentCubit>();

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  buildText('Select Date', context),
                  verticalSpace(10),
                  SizedBox(
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: date.length,
                        itemBuilder: (context, index) {
                          final selectDay = cubit.indexDays == index;
                          return GestureDetector(
                            onTap: () {
                              cubit.selectDay(index, date[index]);
                            },
                            child: Transform.scale(
                              scale: selectDay ? 1.20 : 1.0,
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
                                  color: selectDay
                                      ? ColorManager.primaryColor
                                      : ColorManager.grey40,
                                ),
                                child: Column(
                                  children: [
                                    buildText2(
                                      DateFormat('EEE').format(date[index]),
                                      context,
                                      selectDay,
                                    ),
                                    buildText2(
                                      DateFormat('dd').format(date[index]),
                                      context,
                                      selectDay,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  verticalSpace(10),
                  buildText('Available time', context),
                  verticalSpace(10),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final isSelected = cubit.indexTime == index;
                return GestureDetector(
                  onTap: () {
                    cubit.selectTime(index, cubit.timeList[index]);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: isSelected
                          ? ColorManager.primaryColor
                          : ColorManager.grey40,
                    ),
                    child: Center(
                      child: buildText2(
                        cubit.timeList[index],
                        context,
                        isSelected,
                      ),
                    ),
                  ),
                );
              }, childCount: cubit.timeList.length),
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

                  buildText('Appointment Type', context),
                  verticalSpace(20),
                  Column(
                    children: <Widget>[
                      buildRadio(
                        context: context,
                        image: AppImages.personal,
                        title: 'In Person',
                        value: AppointmentsType.inPerson,
                        groupValue: cubit.selectedType,
                        onChange: () {
                          cubit.selectType(AppointmentsType.inPerson);
                        },
                      ),
                      verticalSpace(5),
                      Divider(color: ColorManager.grey40, height: 3),
                      verticalSpace(5),
                      buildRadio(
                        context: context,
                        image: AppImages.video,
                        title: 'Video Call',
                        value: AppointmentsType.videoCall,
                        groupValue: cubit.selectedType,
                        onChange: () {
                          cubit.selectType(AppointmentsType.videoCall);
                        },
                      ),
                      verticalSpace(5),
                      Divider(color: ColorManager.grey40, height: 3),
                      verticalSpace(5),
                      buildRadio(
                        context: context,
                        image: AppImages.call,
                        title: 'Phone Call',
                        value: AppointmentsType.phoneCall,
                        groupValue: cubit.selectedType,
                        onChange: () {
                          cubit.selectType(AppointmentsType.phoneCall);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: CustomElevatedButton(
                buttonName: 'Book Appointment',
                onPressed: onPressed,
              ),
            ),
          ],
        );
      },
    );
  }

  Text buildText2(String text, BuildContext context, bool selectDay) {
    return Text(
      text,
      style: AppTextStyle.styleBold18(
        selectDay ? ColorManager.grey40 : ColorManager.primaryColor,
        context,
      ),
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
          style: AppTextStyle.styleMedium14(ColorManager.textPrimary, context),
        ),
        Expanded(child: SizedBox.shrink()),
        RadioMenuButton(
          value: value,
          groupValue: groupValue,
          onChanged: (_) {
            return onChange();
          },
          child: null,
        ),
      ],
    );
  }
}
