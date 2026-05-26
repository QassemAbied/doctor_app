import 'package:doctor_app/features/home/domain/entities/specialization_entity.dart';
import 'package:doctor_app/features/home/presentation/controller/doctor/doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/custom_cached_network_image.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../controller/specialization/specialization_cubit.dart';

class ItemForSpecializationWidget extends StatelessWidget {
  final List<SpecializationEntity> data;
  final int index;
  const ItemForSpecializationWidget({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SpecializationCubit>();
    final isSelected = cubit.selectIndex == index;
    final isAll = index == 0;
    final spec= isAll?null:data[index-1];
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: GestureDetector(
        onTap: () {
          cubit.changeIndex(index);

          context.read<DoctorCubit>().filterDoctorsByCategory(
              isAll? 'All' :
              spec?.id??'');
        },
        child: isAll
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'All',
                    style: AppTextStyle.styleBold24(
                      isSelected
                          ? ColorManager.primaryColor
                          : ColorManager.textPrimary,
                      context,
                    ),
                  ),
                ],
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? ColorManager.primaryColor
                        : ColorManager.whiteColor,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomNetworkImage(
                      imageUrl: spec?.image??'',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    verticalSpace(10),
                    Text(
                      spec?.name??'',
                      style: AppTextStyle.styleRegular14(
                        ColorManager.textPrimary,
                        context,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
