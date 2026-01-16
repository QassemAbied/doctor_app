import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class MyAppointmentIsEmpty extends StatelessWidget {
  const MyAppointmentIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/onboarding_doctor_image.png'),
        verticalSpace(40),
        Text(
          'Not Found Appointment',
          style: AppStyles.styleBold18(ColorManager.blackColor, context),
        ),
      ],
    );
  }
}
