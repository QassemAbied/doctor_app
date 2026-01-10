import 'package:flutter/material.dart';

import '../../../core/theming/app_color.dart';
import '../../../core/theming/app_styles.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: AppStyles.styleRegular12(
              ColorManager.geryColor,
              context,
            ),
          ),
          TextSpan(
            text: 'Terms & Conditions',
            style: AppStyles.styleRegular14(
              ColorManager.blackColor,
              context,
            ),
          ),
          TextSpan(
            text: ' and',
            style: AppStyles.styleRegular12(
              ColorManager.geryColor,
              context,
            ),
          ),
          TextSpan(
            text: ' PrivacyPolicy.',
            style: AppStyles.styleRegular14(
              ColorManager.blackColor,
              context,
            ).copyWith(height: 1.4),
          ),
        ],
      ),
    );
  }
}
