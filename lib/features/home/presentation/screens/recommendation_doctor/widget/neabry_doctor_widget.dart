import 'package:doctor_app/features/home/presentation/controller/recommendation/recommendation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common_widgets/custom_cached_network_image.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/app_router/routes.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../controller/recommendation/recommendation_state.dart';

class NearbyDoctorWidget extends StatelessWidget {
  const NearbyDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        final nearbyDoctors = context
            .read<RecommendationCubit>()
            .getNearbyDoctors();
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nearby Doctors',
                  style: AppTextStyle.styleSemiBold18(
                    ColorManager.textPrimary,
                    context,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.mapSampleScreen);
                  },
                  child: Text(
                    'Go To Map',
                    style: AppTextStyle.styleMedium16(
                      ColorManager.primaryColor,
                      context,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: List.generate(nearbyDoctors.length, (index) {
                final doctor = nearbyDoctors[index];

                return ListTile(
                  contentPadding: EdgeInsets.zero,

                  leading: CustomNetworkImage(
                    imageUrl: doctor.image,

                    height: 80,

                    width: 80,

                    fit: BoxFit.fill,

                    heroTag: doctor.id,

                    enableHero: true,
                  ),

                  title: Text(
                    doctor.name,
                    style: AppTextStyle.styleSemiBold16(
                      ColorManager.textPrimary,
                      context,
                    ),
                  ),

                  subtitle: Text(
                    doctor.specializationName,
                    style: AppTextStyle.styleRegular13(
                      ColorManager.textSecondary,
                      context,
                    ),
                  ),

                  trailing: Text(
                    '${(context.read<RecommendationCubit>().calculateDistance(doctor) / 1000).toStringAsFixed(1)} km',
                    style: AppTextStyle.styleRegular13(
                      ColorManager.textSecondary,
                      context,
                    ),
                  ),

                  onTap: () {
                    context.pushNamed(
                      Routes.detailsDoctorsScreen,

                      arguments: doctor.id,
                    );
                  },
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
