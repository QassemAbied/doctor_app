import 'package:doctor_app/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/common_widgets/custom_cached_network_image.dart';
import '../../../core/theming/app_color.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/utils/spacing.dart';
import '../../features/home/domain/entities/doctor_entity.dart';

class CustomDoctorsDataWidget extends StatelessWidget {
  final DoctorEntity doctor;
  final bool showIconMessage;
  final bool notShowRate;
  final bool showStatus;
  final String? day;
  final String? time;
  final String? status;
  final Color? colorStatus;

  const CustomDoctorsDataWidget({
    super.key,
    required this.doctor,
    this.showIconMessage = false,
    this.notShowRate = false,
    this.day,
    this.time,
    this.status,
    this.showStatus = false,
    this.colorStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            showStatus
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        status ?? '',
                        style: AppTextStyle.styleBold16(
                          colorStatus ?? ColorManager.primaryColor,
                          context,
                        ),
                      ),
                      verticalSpace(10),
                      Text(
                        '$day | $time',

                        style: AppTextStyle.styleMedium14(
                          ColorManager.textSecondary,

                          context,
                        ),
                      ),
                      verticalSpace(5),
                      Divider(),
                      verticalSpace(5),
                    ],
                  )
                : const SizedBox.shrink(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNetworkImage(
                  enableHero: true,
                  heroTag: 'doctor_${doctor.id}',
                  imageUrl: doctor.image,
                  width: 95,
                  height: 95,
                  fit: BoxFit.cover,
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
                          ColorManager.textPrimary,
                          context,
                        ),
                      ),

                      verticalSpace(6),

                      Text(
                        '${doctor.gender} • ${doctor.degree}',

                        style: AppTextStyle.styleMedium14(
                          ColorManager.textSecondary,

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

                      notShowRate
                          ? Text(
                              '$day | $time',

                              style: AppTextStyle.styleMedium14(
                                ColorManager.textSecondary,

                                context,
                              ),
                            )
                          : Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),

                                horizontalSpace(4),

                                Text(
                                  '${doctor.rating} (${doctor.reviewsCount} reviews)',

                                  style: AppTextStyle.styleMedium12(
                                    ColorManager.textSecondary,

                                    context,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),

                showIconMessage
                    ? const SizedBox.shrink()
                    : GestureDetector(
                        onTap: () {},

                        child: Container(
                          padding: const EdgeInsets.all(10),

                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor.withValues(
                              alpha: 0.1,
                            ),

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
