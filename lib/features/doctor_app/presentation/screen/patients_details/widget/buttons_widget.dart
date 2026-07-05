import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(24),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.chat),
            label: const Text('Message Patient'),
          ),
        ),
        verticalSpace(12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              // Call Patient
            },
            icon: const Icon(Icons.call),
            label: const Text('Call Patient'),
          ),
        ),
        verticalSpace(24),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Appointment History',
            style: AppTextStyle.styleBold18(ColorManager.textPrimary, context),
          ),
        ),
        verticalSpace(16),
      ],
    );
  }
}
