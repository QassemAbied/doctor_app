import 'package:flutter/material.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';

class RowTextTextButton extends StatelessWidget {
  final String text;
  final VoidCallback tap;
  const RowTextTextButton({super.key, required this.text, required this.tap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppTextStyle.styleSemiBold16(
            ColorManager.textPrimary,
            context,
          ),
        ),
        Expanded(child: SizedBox()),
        TextButton(onPressed: tap, child: Text('See All')),
      ],
    );
  }
}
