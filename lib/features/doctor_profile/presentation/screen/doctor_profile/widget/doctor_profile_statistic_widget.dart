import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';

class DoctorStatisticsWidget extends StatelessWidget {
  final int patients;

  final int reviews;

  final int experience;

  const DoctorStatisticsWidget({
    super.key,
    required this.patients,
    required this.reviews,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatisticItem(title: 'Patients', value: '$patients'),
        ),

        horizontalSpace(12),

        Expanded(
          child: _StatisticItem(title: 'Reviews', value: '$reviews'),
        ),

        horizontalSpace(12),

        Expanded(
          child: _StatisticItem(title: 'Experience', value: '$experience Y'),
        ),
      ],
    );
  }
}

class _StatisticItem extends StatelessWidget {
  final String title;

  final String value;

  const _StatisticItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyle.styleBold24(ColorManager.primaryColor, context),
          ),

          verticalSpace(6),

          Text(
            title,
            style: AppTextStyle.styleRegular14(
              ColorManager.textSecondary,
              context,
            ),
          ),
        ],
      ),
    );
  }
}