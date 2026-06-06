import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../shared_widget/custom_texts_appointment.dart';

class AppointPrice extends StatelessWidget {
  final double price;
  const AppointPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final subPrice = int.parse(price.toStringAsFixed(0)) / 2;
    final total = price + subPrice;
    return Column(
      children: [
        buildText('Payment Info', context),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: AppTextStyle.styleMedium16(
                ColorManager.textSecondary,
                context,
              ),
            ),
            Text(
              '\$$price',
              style: AppTextStyle.styleSemiBold16(
                ColorManager.textPrimary,
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
              style: AppTextStyle.styleMedium16(
                ColorManager.textSecondary,
                context,
              ),
            ),
            Text(
              '\$$subPrice',
              style: AppTextStyle.styleSemiBold16(
                ColorManager.textPrimary,
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
              'Payment Total',
              style: AppTextStyle.styleBold18(
                ColorManager.textPrimary,
                context,
              ),
            ),
            Text(
              '\$$total',
              style: AppTextStyle.styleSemiBold16(
                ColorManager.textPrimary,
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
