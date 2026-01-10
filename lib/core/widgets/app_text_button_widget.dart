import 'package:flutter/material.dart';

import '../theming/app_color.dart';
import '../theming/app_styles.dart';

class AppTextButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final Color? colorButton;
  final Color? colorText;
  const AppTextButtonWidget({super.key,this.colorButton, required this.buttonName, required this.onPressed, this.colorText});

  @override
  Widget build(BuildContext context) {
    return   TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          colorButton?? ColorManager.mainBlueColor,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 50)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          buttonName,
          style: AppStyles.styleSemiBold16(
              colorText??Colors.white, context),
        ),
      ),
    );
  }
}
