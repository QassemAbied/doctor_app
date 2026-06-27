import 'package:flutter/material.dart';

import '../theming/app_color.dart';
import '../theming/app_styles.dart';
import 'custom_cached_network_image.dart';

class CustomImageOrNameWidget extends StatelessWidget {
  const CustomImageOrNameWidget({super.key, required this.name, required this.image, this.radius});
  final String name;
  final String image;
  final double? radius ;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius:radius?? 30,
      backgroundColor: ColorManager.primary40,
      child: image.isEmpty
          ? Text(
            name.substring(0, 1).toUpperCase(),
        style: AppTextStyle.styleBold24(
          ColorManager.textPrimary,
          context,
        ),
      )
          : CustomNetworkImage(imageUrl: image),
    );
  }
}
