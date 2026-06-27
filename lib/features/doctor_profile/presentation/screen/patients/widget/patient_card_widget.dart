import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_image_or_name_widget.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../chat/presentation/screen/chat/chat_screen.dart';
import '../../patients_details/patient_details_screen.dart';

class PatientCard extends StatelessWidget {
  final UserEntity? patient;

  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PatientDetailsScreen(
              patient: patient,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomImageOrNameWidget(
              name: patient?.name??'',
              image: patient?.image??'',
            ),

            horizontalSpace(12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient?.name??'',
                    style: AppTextStyle.styleBold16(
                      ColorManager.textPrimary,
                      context,
                    ),
                  ),

                  verticalSpace(4),

                  Text(
                    patient?.phone??'',
                    style: AppTextStyle.styleRegular14(
                      ColorManager.textSecondary,
                      context,
                    ),
                  ),

                  verticalSpace(6),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.primary20,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Patient',
                      style: AppTextStyle.styleMedium12(
                        ColorManager.primaryColor,
                        context,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          receiverId: patient?.id??'',
                          doctorName: patient?.name??'',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.chat_bubble_outline),
                ),

                IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.call_outlined),
                ),
              ],
            ),

            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
