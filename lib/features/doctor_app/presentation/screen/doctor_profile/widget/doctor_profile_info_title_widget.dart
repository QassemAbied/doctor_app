import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';

class DoctorInfoTile extends StatelessWidget {
  final IconData icon;

  final String title;

  final String value;

  const DoctorInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: ColorManager.primary20,
        child: Icon(icon, color: ColorManager.primaryColor),
      ),
      title: Text(
        title,
        style: AppTextStyle.styleMedium14(ColorManager.textSecondary, context),
      ),
      subtitle: Text(
        value,
        style: AppTextStyle.styleBold16(ColorManager.textPrimary, context),
      ),
    );
  }
}
