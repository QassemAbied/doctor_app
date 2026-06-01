import 'package:doctor_app/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common_widgets/custom_cached_network_image.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../home/domain/entities/doctor_entity.dart';

class DoctorsDataWidget extends StatelessWidget {
  final DoctorEntity doctor;

  const DoctorsDataWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: doctor.id,
                  child: CustomNetworkImage(
                    imageUrl: doctor.image,
                    width: 95,
                    height: 95,
                    borderRadius: BorderRadius.circular(18),
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        doctor.name,

                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,

                        style: AppTextStyle.styleBold18(
                          ColorManager.blackColor,

                          context,
                        ),
                      ),

                      verticalSpace(6),

                      Text(
                        '${doctor.gender} • ${doctor.degree}',

                        style: AppTextStyle.styleMedium14(
                          ColorManager.grey80,

                          context,
                        ),
                      ),

                      verticalSpace(8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),

                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor.withValues(
                            alpha: 0.1,
                          ),

                          borderRadius: BorderRadius.circular(30),
                        ),

                        child: Text(
                          doctor.specializationName,

                          style: AppTextStyle.styleMedium12(
                            ColorManager.primaryColor,

                            context,
                          ),
                        ),
                      ),

                      verticalSpace(10),

                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),

                          horizontalSpace(4),

                          Text(
                            '${doctor.rating} (${doctor.reviewsCount} reviews)',

                            style: AppTextStyle.styleMedium12(
                              ColorManager.grey80,

                              context,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {},

                  child: Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor.withValues(alpha: 0.1),

                      shape: BoxShape.circle,
                    ),

                    child: SvgPicture.asset(AppSvgs.messageText),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

