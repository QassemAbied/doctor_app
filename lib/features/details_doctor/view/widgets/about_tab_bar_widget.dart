import 'package:flutter/material.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../data/models/details_doctors_models.dart';

class AboutTabBarWidget extends StatelessWidget {
  final DataForDoctors? dataForDoctors;
  const AboutTabBarWidget({super.key,required this.dataForDoctors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About me',
            style: AppTextStyle.styleSemiBold16(
              ColorManager.blackColor,
              context,
            ),
          ),
          verticalSpace(15),
           Text(
            '${dataForDoctors?.name} is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.',
            style: AppTextStyle.styleRegular14(
              ColorManager.grey80,
              context,
            ),
          ),
          verticalSpace(30),
           Text(
            'Working Time',
            style: AppTextStyle.styleSemiBold16(
              ColorManager.blackColor,
              context,
            ),
          ),
          verticalSpace(15),
           Text(
            'Monday - Friday,${dataForDoctors?.startTime} ${dataForDoctors?.startTime}',
            style: AppTextStyle.styleRegular14(
              ColorManager.grey80,
              context,
            ),
          ),
          verticalSpace(30),
           Text(
            'STR',
            style: AppTextStyle.styleSemiBold16(
              ColorManager.blackColor,
              context,
            ),
          ),
          verticalSpace(15),
           Text(
            dataForDoctors?.phone??'',
            style: AppTextStyle.styleRegular14(
              ColorManager.grey80,
              context,
            ),
          ),
          verticalSpace(30),
           Text(
            'Pengalaman Praktik',
            style: AppTextStyle.styleSemiBold16(
              ColorManager.blackColor,
              context,
            ),
          ),
          verticalSpace(30),
           Text(
            'RSPAD Gatot Soebroto',
            style: AppTextStyle.styleSemiBold16(
              ColorManager.blackColor,
              context,
            ),
          ),
          verticalSpace(15),
           Text(
            '2017 - ${ dataForDoctors?.degree}',
            style: AppTextStyle.styleRegular14(
              ColorManager.grey80,
              context,
            ),
          ),
        ],
      ),
    );
  }
}
