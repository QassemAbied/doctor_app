import 'package:flutter/material.dart';

import '../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class AllButtonInMyAppointments extends StatelessWidget {
  const AllButtonInMyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorManager.blackColor),
            ),

            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Cancel Appointment',
                  style: AppTextStyle.styleSemiBold16(
                    ColorManager.blackColor,
                    context,
                  ),
                ),
              ),
            ),
          ),
        ),
        horizontalSpace(18),
        Expanded(
          child: CustomElevatedButton(
            buttonName: 'Reschedule',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
