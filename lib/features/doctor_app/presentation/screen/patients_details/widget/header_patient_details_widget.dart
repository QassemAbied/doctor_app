import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_image_or_name_widget.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../auth/domain/entities/user_entity.dart';

class HeaderPatientDetailsWidget extends StatelessWidget {
  final UserEntity? patient;

  const HeaderPatientDetailsWidget({super.key, this.patient});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageOrNameWidget(
          radius: 40,
          name: patient?.name ?? "",
          image: patient?.image ?? "",
        ),

        verticalSpace(16),

        Text(
          patient?.name ?? "",
          style: AppTextStyle.styleBold24(ColorManager.textPrimary, context),
        ),

        verticalSpace(8),

        Text(
          patient?.phone ?? "",
          style: AppTextStyle.styleRegular14(
            ColorManager.textSecondary,
            context,
          ),
        ),

        verticalSpace(24),
      ],
    );
  }
}
