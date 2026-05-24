import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class BookInformationItem extends StatelessWidget {
  final String title1;
  final String images;
  final String title2;final String? title3;
      final BuildContext context;
  const BookInformationItem({super.key, required this.title1, required this.images, required this.title2, this.title3, required this.context});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(images),
        horizontalSpace(15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: AppTextStyle.styleSemiBold14(
                ColorManager.blackColor,
                context,
              ),
            ),
            verticalSpace(5),
            Text(
              title2,
              style: AppTextStyle.styleMedium14(
                ColorManager.grey80,
                context,
              ),
            ),
            Text(
              title3 ?? '',
              style: AppTextStyle.styleMedium14(
                ColorManager.grey80,
                context,
              ),
            ),
          ],
        ),
      ],
    );



  }
}
