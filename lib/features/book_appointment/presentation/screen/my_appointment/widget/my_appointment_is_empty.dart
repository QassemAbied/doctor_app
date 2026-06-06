import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class MyAppointmentIsEmpty extends StatelessWidget {
  const MyAppointmentIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Image.asset('assets/images/onboarding_doctor_image.png', height: 250),

          verticalSpace(24),

          Text(
            'Not Found Appointment',

            style: AppTextStyle.styleBold18(ColorManager.blackColor, context),
          ),
        ],
      ),
    );
  }
}
