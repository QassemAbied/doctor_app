import 'package:flutter/material.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class AppointPrice extends StatelessWidget {
  const AppointPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Payment Info',
          style: AppTextStyle.styleSemiBold16(
            ColorManager.blackColor,
            context,
          ),
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: AppTextStyle.styleRegular14(
                ColorManager.grey80,
                context,
              ),
            ),
            Text(
              '\$${300}',
              style: AppTextStyle.styleSemiBold16(
                ColorManager.blackColor,
                context,
              ),
            ),
          ],
        ),
        verticalSpace(10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax',
              style: AppTextStyle.styleRegular14(
                ColorManager.grey80,
                context,
              ),
            ),
            Text(
              '\$${300 / 2}',
              style: AppTextStyle.styleSemiBold16(
                ColorManager.blackColor,
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
