import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../data/models/details_doctors_models.dart';

class DoctorsDataWidget extends StatelessWidget {
 final DataForDoctors? dataForDoctors;
  const DoctorsDataWidget({
    super.key,required this.dataForDoctors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/doctor_image.png',
          width: 90,
          height: 90,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dataForDoctors?.name ?? '',
              style: AppTextStyle.styleBold16(
                ColorManager.blackColor,
                context,
              ),
            ),
            verticalSpace(5),
            Text(
              '${dataForDoctors?.gender} - ${dataForDoctors?.email}',
              style: AppTextStyle.styleMedium12(
                ColorManager.grey80,
                context,
              ),
            ),
          ],
        ),
        SvgPicture.asset('assets/svgs/message-text.svg'),
      ],
    );
  }
}
