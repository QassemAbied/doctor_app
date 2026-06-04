import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../controller/doctor/doctors_cubit.dart';
import '../../../controller/specialization/specialization_cubit.dart';
import '../../../controller/specialization/specialization_state.dart';

void showFilterBottomSheet(BuildContext context) {
  final doctorCubit = context.read<DoctorCubit>();

  final specializationCubit = context.read<SpecializationCubit>();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(24),

        decoration: const BoxDecoration(
          color: ColorManager.whiteColor,

          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(
              child: Text(
                'Sort By',

                style: AppTextStyle.styleBold24(
                  ColorManager.textPrimary,
                  context,
                ),
              ),
            ),

            verticalSpace(24),

            Divider(),

            verticalSpace(24),

            Text(
              'Speciality',

              style: AppTextStyle.styleSemiBold18(
                ColorManager.textPrimary,
                context,
              ),
            ),

            verticalSpace(16),

            SizedBox(
              height: 45,

              child: BlocBuilder<SpecializationCubit, SpecializationState>(
                builder: (context, state) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: specializationCubit.categories.length + 1,

                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return filterChip(
                          title: 'All',

                          selected: specializationCubit.selectIndex == 0,

                          onSelected: () {
                            specializationCubit.changeIndex(0);

                            doctorCubit.filterDoctorsByCategory('All');
                            context.pop();
                          },
                          context: context,
                        );
                      }

                      final category =
                          specializationCubit.categories[index - 1];

                      return filterChip(
                        title: category.name,

                        selected: specializationCubit.selectIndex == index,

                        onSelected: () {
                          specializationCubit.changeIndex(index);

                          doctorCubit.filterDoctorsByCategory(category.id);
                          context.pop();
                        },
                        context: context,
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            CustomElevatedButton(
              buttonName: 'Done',
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget filterChip({
  required String title,
  required BuildContext context,

  required bool selected,

  required VoidCallback onSelected,
}) {
  return Container(
    margin: const EdgeInsets.only(right: 12),

    child: ChoiceChip(
      label: Text(title),

      selected: selected,

      onSelected: (_) => onSelected(),

      selectedColor: ColorManager.primaryColor,

      backgroundColor: Colors.grey.shade100,

      labelStyle: AppTextStyle.styleMedium14(
        selected ? ColorManager.whiteColor : ColorManager.textSecondary,
        context,
      ),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
  );
}
