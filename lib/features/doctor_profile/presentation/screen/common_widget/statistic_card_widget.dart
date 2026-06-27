import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';

class StatisticCard extends StatelessWidget {
  final String? title;
  final String value;
  final IconData icon;
  final bool showTitle;

  const StatisticCard({
    super.key,
     this.title,
    required this.value,
    required this.icon,
    this.showTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Icon(icon, color: ColorManager.primaryColor, size: 32),

          verticalSpace(12),

          Text(
            value,
            style: AppTextStyle.styleBold18(ColorManager.textPrimary, context),
          ),

          verticalSpace(4),

          showTitle
              ? Text(
                  title??'',
                  style: AppTextStyle.styleRegular14(
                    ColorManager.textSecondary,
                    context,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
