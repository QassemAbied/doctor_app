import 'package:flutter/material.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';



Text buildText(String text, BuildContext context) {
  return Text(
    text,
    style: AppTextStyle.styleBold18(ColorManager.textPrimary, context),
  );
}
