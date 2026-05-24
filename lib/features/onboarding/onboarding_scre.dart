import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/features/onboarding/widgets/custom_icon_name.dart';
import 'package:doctor_app/features/onboarding/widgets/custom_image_big_text.dart';
import 'package:doctor_app/features/onboarding/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Column(
                  children: [
                    CustomIconAndName(),
                    verticalSpace(30),
                    Expanded(child: CustomImageAndBigText()),
                    verticalSpace(30),
                    CustomTextAndButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
