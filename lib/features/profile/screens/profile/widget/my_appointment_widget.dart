import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class MyAppointmentWidget extends StatelessWidget {
  const MyAppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: (){},
                child: Text('My Appointment',
                  style: AppTextStyle.styleMedium16(ColorManager.blackColor, context),)
            ),
            Container(
              height: 20,
              width: 1,
              color: ColorManager.grey100,
            ),
            TextButton(
                onPressed: (){},
                child: Text('My Appointment',
                  style: AppTextStyle.styleMedium16(ColorManager.blackColor, context),)
            ),

          ],
        ),
      ),
    );
  }
}
