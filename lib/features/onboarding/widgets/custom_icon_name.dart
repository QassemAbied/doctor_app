import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theming/app_color.dart';
import '../../../core/theming/app_styles.dart';

class CustomIconAndName extends StatelessWidget {
  const CustomIconAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/icon_app.svg'),
        SizedBox(
          width: 10,
        ),
        Text(
          'Docdoc',
          style: AppTextStyle.styleBold24(
            ColorManager.blackColor,
            context,
          ),
        ),
      ],
    );
  }
}
