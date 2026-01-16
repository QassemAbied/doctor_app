import 'package:doctor_app/core/helpers/extension.dart';
import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/widgets/app_text_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/app_color.dart';
import '../../../core/theming/app_styles.dart';

class CustomTextAndButton extends StatelessWidget {
  const CustomTextAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
            textAlign: TextAlign.center,

            style: AppStyles.styleRegular13(ColorManager.geryColor, context),
          ),
          verticalSpace(30),
          AppTextButtonWidget(
            buttonName: 'Get Started',
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
