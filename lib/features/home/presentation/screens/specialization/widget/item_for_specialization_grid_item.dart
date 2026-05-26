import 'package:flutter/material.dart';
import '../../../../../../core/common_widgets/custom_cached_network_image.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../domain/entities/specialization_entity.dart';
import '../../doctors/doctor_by_specialization_screen.dart';

class ItemForSpecializationGridItem extends StatelessWidget {
  final SpecializationEntity specialization;

  const ItemForSpecializationGridItem({
    super.key,

    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) =>
                DoctorBySpecializationScreen(
                  specializationId: specialization.id,
                  specializationName: specialization.name,
                ),
          ),
        );
      },
      child: Column(
        children: [
          CustomNetworkImage(
            imageUrl: specialization.image,

            width: 60,

            height: 60,

            fit: BoxFit.cover,
          ),

          verticalSpace(10),

          Text(
            specialization.name,

            textAlign: TextAlign.center,

            style: AppTextStyle.styleMedium14(
              ColorManager.textPrimary,
              context,
            ),
          ),
        ],
      ),
    );
  }
}
