import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';

class WelcomeMessage extends StatelessWidget {
  final String welcomeText;
  final String subWelcomeText;
  const WelcomeMessage({
    super.key,
    required this.welcomeText,
    required this.subWelcomeText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          welcomeText,
          style: AppTextStyle.styleBold24(ColorManager.primaryColor, context),
        ),
        verticalSpace(18.0),
        Text(
          subWelcomeText,
          style: AppTextStyle.styleRegular14(ColorManager.grey60, context),
        ),
      ],
    );
  }
}
