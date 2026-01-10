import 'package:doctor_app/core/helpers/extension.dart';
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
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
            textAlign: TextAlign.center,

            style: AppStyles.styleRegular13(ColorManager.geryColor, context),
          ),
          SizedBox(height: 30.0),
          AppTextButtonWidget(
            buttonName: 'Get Started',
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
          ),

          // TextButton(
          //   style: ButtonStyle(
          //     backgroundColor: WidgetStateProperty.all(
          //       ColorManager.mainBlueColor,
          //     ),
          //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //     minimumSize: WidgetStateProperty.all(Size(double.infinity, 50)),
          //     shape: WidgetStateProperty.all(
          //       RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(16.0),
          //       ),
          //     ),
          //   ),
          //   onPressed: () {
          //     context.pushNamed(Routes.loginScreen);
          //   },
          //   child: Text(
          //     'Get Started',
          //     style: AppStyles.styleSemiBold16(Colors.white, context),
          //   ),
          // ),
        ],
      ),
    );
  }
}
