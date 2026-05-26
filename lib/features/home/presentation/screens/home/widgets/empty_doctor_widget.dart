import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_styles.dart';

class EmptyDoctorsWidget extends StatelessWidget {
  final String? message;

  const EmptyDoctorsWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: ColorManager.grey40,
              ),

              child: Icon(
                Icons.medical_services_outlined,

                size: 70,

                color: ColorManager.grey60,
              ),
            ),

            verticalSpace(24),

            Text(
              'No Doctors Found',

              style: AppTextStyle.styleBold18(
                ColorManager.textPrimary,
                context,
              ),
            ),

            verticalSpace(10),

            Text(
              message ??
                  'There are no doctors available\nfor this specialization yet.',

              textAlign: TextAlign.center,

              style: AppTextStyle.styleRegular14(
                ColorManager.textSecondary,
                context,
              ).copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
