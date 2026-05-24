import 'package:flutter/material.dart';

import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class RowTextTextButton extends StatelessWidget {
  final String text;
  final VoidCallback tap;
  const RowTextTextButton({super.key, required this.text, required this.tap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          text,
         // 'Recommendation Doctor',
          style: AppTextStyle.styleSemiBold18(
            ColorManager.blackColor,
            context,
          ),
        ),
        Expanded(child: SizedBox()),
        TextButton(
          onPressed: tap,
          child: Text(
            'See All',
            style: AppTextStyle.styleRegular14(
              ColorManager.primaryColor,
              context,
            ),
          ),
        ),
      ],
    );
  }
}
