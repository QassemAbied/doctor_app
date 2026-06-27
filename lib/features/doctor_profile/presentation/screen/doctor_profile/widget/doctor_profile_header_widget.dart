import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../home/domain/entities/doctor_entity.dart';

class DoctorProfileHeader extends StatelessWidget {
  final DoctorEntity doctor;

  const DoctorProfileHeader({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          CircleAvatar(radius: 48, backgroundImage: NetworkImage(doctor.image)),

          verticalSpace(16),

          Text(
            doctor.name,
            style: AppTextStyle.styleBold32(ColorManager.whiteColor, context),
          ),

          verticalSpace(6),

          Text(
            doctor.specializationName,
            style: AppTextStyle.styleRegular14(
              ColorManager.whiteColor,
              context,
            ),
          ),

          verticalSpace(16),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),

                horizontalSpace(6),

                Text(
                  doctor.rating.toString(),
                  style: AppTextStyle.styleMedium14(
                    ColorManager.whiteColor,
                    context,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
