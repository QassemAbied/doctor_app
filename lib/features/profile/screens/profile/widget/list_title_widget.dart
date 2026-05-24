import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';


class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });
  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(image, height: 50, width: 50),
      title: Text(
        text,
        style: AppTextStyle.styleMedium16(ColorManager.blackColor, context),
      ),
      onTap: onTap,
    );
  }
}
