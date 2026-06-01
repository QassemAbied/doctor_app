import 'package:flutter/material.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../home/domain/entities/doctor_entity.dart';


class AboutDoctorWidget extends StatelessWidget {
  final DoctorEntity doctor;

  const AboutDoctorWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                _InfoItem(
                  icon: Icons.people_alt_outlined,

                  value: '${doctor.patientsCount}+',

                  label: 'Patients',
                ),

                _InfoItem(
                  icon: Icons.work_outline,

                  value: '${doctor.experienceYears} Yrs',

                  label: 'Experience',
                ),

                _InfoItem(
                  icon: Icons.attach_money,

                  value: '${doctor.price} EGP',

                  label: 'Price',
                ),
              ],
            ),
          ),
          verticalSpace(12),
          Text(
            'About Doctor',
            style: AppTextStyle.styleBold18(ColorManager.textPrimary, context),
          ),
      
          verticalSpace(12),
      
          Text(
            doctor.about,
            style: AppTextStyle.styleRegular14(
              ColorManager.textSecondary,
      
              context,
            ),
          ),
      
          verticalSpace(24),
      
          Text(
            'Working Time',
            style: AppTextStyle.styleSemiBold18(
              ColorManager.textPrimary,
      
              context,
            ),
          ),
      
          verticalSpace(12),
      
          Text(
            '${doctor.openTime} - ${doctor.closeTime}',
      
            style: AppTextStyle.styleRegular14(
              ColorManager.textSecondary,
      
              context,
            ),
          ),
      
          verticalSpace(24),
      
          Text(
            'Phone Number',
      
            style: AppTextStyle.styleSemiBold18(
              ColorManager.textPrimary,
      
              context,
            ),
          ),
      
          verticalSpace(12),
      
          Text(
            doctor.phone,
      
            style: AppTextStyle.styleRegular14(
              ColorManager.textSecondary,
      
              context,
            ),
          ),
      
          verticalSpace(24),
      
          Text(
            'Location',
      
            style: AppTextStyle.styleSemiBold18(
              ColorManager.textPrimary,
      
              context,
            ),
          ),
      
          verticalSpace(12),
      
          Text(
            doctor.location,
      
            style: AppTextStyle.styleRegular14(
              ColorManager.textSecondary,
      
              context,
            ),
          ),
      
          verticalSpace(24),
      
          Text(
            'Experience',
      
            style: AppTextStyle.styleSemiBold18(
              ColorManager.textPrimary,
      
              context,
            ),
          ),
      
          verticalSpace(12),
      
          Text(
            '${doctor.experienceYears} Years',
      
            style: AppTextStyle.styleRegular14(
              ColorManager.textSecondary,
      
              context,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;

  final String value;

  final String label;

  const _InfoItem({
    required this.icon,

    required this.value,

    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: ColorManager.primaryColor),

        const SizedBox(height: 6),

        Text(
          value,

          style: AppTextStyle.styleSemiBold14(ColorManager.blackColor, context),
        ),

        const SizedBox(height: 2),

        Text(
          label,

          style: AppTextStyle.styleRegular12(ColorManager.grey80, context),
        ),
      ],
    );
  }
}

