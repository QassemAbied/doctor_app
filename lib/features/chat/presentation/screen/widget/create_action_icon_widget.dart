import 'package:flutter/material.dart';

import '../../../../../core/theming/app_color.dart';

class CreateActionIconWidget extends StatelessWidget {
  const CreateActionIconWidget({
    super.key,
    required this.iconData,
    required this.onTap,
  });
  final IconData iconData;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),

      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 42,
          height: 42,

          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.grey40),

            borderRadius: BorderRadius.circular(14),
          ),

          child: Icon(iconData, color: ColorManager.blackColor),
        ),
      ),
    );
  }
}
