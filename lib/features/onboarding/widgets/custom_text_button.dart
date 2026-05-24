import 'package:doctor_app/core/services/shared_pref/shared_pref_keys.dart';
import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/core/services/shared_pref/shared_pref_helpers.dart';
import 'package:doctor_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import '../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../core/theming/app_color.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/utils/app_router/routes.dart';

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

            style: AppTextStyle.styleRegular13(ColorManager.grey80, context),
          ),
          verticalSpace(30),
          CustomElevatedButton(
            buttonName: 'Get Started',
            onPressed: () {
              SharedPrefHelper.setData(SharedPrefKeys.isOnBoarding, checkIsOnBoarding);
              context.pushNamed(Routes.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
