import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentation/controller/auth_cubit.dart';
import '../../utils/app_router/routes.dart';
import '../../utils/extension.dart';

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
            text,
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

  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorManager.primaryColor,
        content: Text(
          text,
          style: AppTextStyle.styleBold16(ColorManager.whiteColor, context),
        ),
      ),
    );
  }

  static Future logOutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Logout',
            style: AppTextStyle.styleBold16(ColorManager.textPrimary, context),
          ),
          content: Text(
            'You’ll need to enter your email and password next time you want to login',
            style: AppTextStyle.styleMedium14(
              ColorManager.textSecondary,
              context,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancel'),
            ),

            TextButton(
              onPressed: () async {
                context.pop();
                context.read<AuthCubit>().signOut();
                await context.pushNamedAndRemoveUntil(Routes.loginScreen);
              },
              child: Text(
                'Logout',
                style: AppTextStyle.styleBold16(ColorManager.fillRed, context),
              ),
            ),
          ],
        );
      },
    );
  }
}
