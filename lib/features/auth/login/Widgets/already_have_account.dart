import 'package:doctor_app/core/helpers/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account yet? ',
              style: AppStyles.styleRegular14(
                ColorManager.blackColor,
                context,
              ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed('/signUp');
                },
              text: ' Sign Up ',
              style: AppStyles.styleSemiBold16(
                ColorManager.mainBlueColor,
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
