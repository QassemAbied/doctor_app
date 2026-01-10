import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';


class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase,context),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase,context),
        verticalSpace(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters,context),
        verticalSpace(2),
        buildValidationRow('At least 1 number', hasNumber,context),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength,context),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated, BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorManager.geryColor
        ),
        horizontalSpace(6),
        Text(
          text,
          style: AppStyles.styleRegular14(hasValidated ? ColorManager.geryColor : ColorManager.mainBlueColor,
              context).copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor:ColorManager.geryColor,
            decorationThickness: 2,
            color: hasValidated ? ColorManager.geryColor : ColorManager.mainBlueColor,
          ),
        )
      ],
    );
  }
}