import 'package:flutter/material.dart';

class BannerFromHome extends StatelessWidget {
  const BannerFromHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343/197,
      //  aspectRatio:0.8 / 0.5,
      child: Image.asset('assets/images/Banner.png'),
    );
  }
}
