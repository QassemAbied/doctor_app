import 'package:doctor_app/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class BannerFromHome extends StatelessWidget {
  const BannerFromHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343/197,
      child: Image.asset(AppImages.banner),
    );
  }
}
