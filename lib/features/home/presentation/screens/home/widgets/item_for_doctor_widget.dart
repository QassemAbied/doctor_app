import 'package:doctor_app/core/common_widgets/custom_cached_network_image.dart';
import 'package:doctor_app/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../../core/utils/spacing.dart';


class ItemForDoctorWidget extends StatelessWidget {
  final List<DoctorEntity>? doctors;
  final int index;
  const ItemForDoctorWidget({
    super.key,
    required this.doctors,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          final id = doctors?[index].id;

          if (id == null) return;
          context.pushNamed('/detailsDoctors', arguments: id);
        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorManager.primaryColor),
              ),
              child: Skeletonizer.of(context).enabled

                  ? Bone.square(
                size: 100,
                borderRadius:
                BorderRadius.circular(12),
              )

                  :CustomNetworkImage(
                imageUrl: doctors?[index].image ?? '',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),

            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctors?[index].name ?? '',
                  style: AppTextStyle.styleSemiBold16(
                    ColorManager.textPrimary,
                    context,
                  ),
                ),
                verticalSpace(5),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '${doctors?[index].gender} - ${doctors?[index].degree}',
                    style: AppTextStyle.styleRegular13(
                      ColorManager.textSecondary,
                      context,
                    ),
                  ),
                ),
                verticalSpace(5),
                Text(
                  doctors?[index].specializationName ?? '',
                  style: AppTextStyle.styleRegular13(
                    ColorManager.textSecondary,
                    context,
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
