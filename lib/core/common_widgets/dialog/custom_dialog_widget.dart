import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDialogWidget {
  static Future<void> circleDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  static Future<void> errorDialog(BuildContext context, String text) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'ERORR',
            style: AppTextStyle.styleBold18(ColorManager.fillRed, context),
          ),
          content: Text(
            text,
            style: AppTextStyle.styleBold18(ColorManager.textPrimary, context),
          ),
        );
      },
    );
  }

  static void showSnackBar(BuildContext context, String text){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorManager.primaryColor,
        content: Text(text,
          style: AppTextStyle.styleBold16(ColorManager.whiteColor, context),
        ),
      ),
    );
  }
}
