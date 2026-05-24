import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomImageAndBigText extends StatefulWidget {
  const CustomImageAndBigText({super.key});

  @override
  State<CustomImageAndBigText> createState() => _CustomImageAndBigTextState();
}

class _CustomImageAndBigTextState extends State<CustomImageAndBigText> {
  final PageController controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List doctorImages = [
    'assets/images/onboarding_doctor_image.png',
    'assets/images/onboarding_doctor_image2.jpg',
    'assets/images/onboarding_doctor_image3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  SvgPicture.asset('assets/svgs/icon_app_opacity.svg'),
                  Container(
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.white.withAlpha(0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.14, 0.4],
                      ),
                    ),
                    child: Center(child: Image.asset(doctorImages[index])),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 30,
                    child: Text(
                      'Best Doctor\n Appointment App',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.styleBold32(
                        ColorManager.primaryColor,
                        context,
                      ).copyWith(height: 1.4),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          axisDirection: Axis.horizontal,
          effect: SlideEffect(
            spacing: 8.0,
            radius: 10.0,
            dotWidth: 16.0,
            dotHeight: 16.0,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.5,
            dotColor: ColorManager.grey100,
            activeDotColor: ColorManager.primaryColor,
          ),
        ),
      ],
    );
  }
}
