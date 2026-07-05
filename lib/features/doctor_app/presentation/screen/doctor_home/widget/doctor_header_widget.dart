import 'package:doctor_app/core/common_widgets/custom_image_or_name_widget.dart';
import 'package:doctor_app/core/utils/app_router/routes.dart';
import 'package:doctor_app/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/app_svgs.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../home/domain/entities/doctor_entity.dart';

class DoctorHeaderWidget extends StatelessWidget {
  final DoctorEntity doctor;

  const DoctorHeaderWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomImageOrNameWidget(name: doctor.name, image: doctor.image),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. ${doctor.name}',
                  style: AppTextStyle.styleBold18(
                    ColorManager.whiteColor,
                    context,
                  ),
                ),

                verticalSpace(6),

                Text(
                  doctor.specializationName,
                  style: AppTextStyle.styleSemiBold16(
                    ColorManager.whiteColor,
                    context,
                  ),
                ),

                verticalSpace(8),

                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),

                    horizontalSpace(4),

                    Text(
                      doctor.rating.toString(),
                      style: AppTextStyle.styleMedium16(
                        ColorManager.whiteColor,
                        context,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(16),
          GestureDetector(
              onTap: () {
                context.pushNamed(Routes.notificationScreen);
              },
              child: SvgPicture.asset(AppSvgs.notification),),
        ],
      ),
    );
  }
}
