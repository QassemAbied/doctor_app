import 'package:doctor_app/features/home/presentation/controller/recommendation/recommendation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../controller/recommendation/recommendation_state.dart';

// void showFilterBottomSheet(BuildContext context) {
//
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (_) {
//       return Container(
//         padding: const EdgeInsets.all(24),
//
//         decoration: const BoxDecoration(
//           color: ColorManager.whiteColor,
//
//           borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//         ),
//
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//
//           crossAxisAlignment: CrossAxisAlignment.start,
//
//           children: [
//             Center(
//               child: Text(
//                 'Sort By',
//
//                 style: AppTextStyle.styleBold24(
//                   ColorManager.textPrimary,
//                   context,
//                 ),
//               ),
//             ),
//
//             verticalSpace(24),
//
//             Divider(),
//
//             verticalSpace(24),
//
//             Text(
//               'Speciality',
//
//               style: AppTextStyle.styleSemiBold18(
//                 ColorManager.textPrimary,
//                 context,
//               ),
//             ),
//
//             verticalSpace(16),
//
//             SizedBox(
//               height: 45,
//
//               child: BlocBuilder<RecommendationCubit, RecommendationState>(
//                 builder: (context, state) {
//                   final recommendationCubit = context.read<RecommendationCubit>();
//
//                   return ListView.builder(
//                     scrollDirection: Axis.horizontal,
//
//                     itemCount: recommendationCubit.categories.length + 1,
//
//                     itemBuilder: (context, index) {
//                       if (index == 0) {
//                         return filterChip(
//                           title: 'All',
//
//                           selected: recommendationCubit.selectIndex == 0,
//
//                           onSelected: () {
//                             recommendationCubit.changeIndex(0);
//
//                             recommendationCubit.filterDoctorsByCategory('All');
//                             context.pop();
//                           },
//                           context: context,
//                         );
//                       }
//
//                       final category =
//                       recommendationCubit.categories[index - 1];
//
//                       return filterChip(
//                         title: category.name,
//
//                         selected: recommendationCubit.selectIndex == index,
//
//                         onSelected: () {
//                           recommendationCubit.changeIndex(index);
//
//                           recommendationCubit.filterDoctorsByCategory(category.id);
//                           context.pop();
//                         },
//                         context: context,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//
//             const SizedBox(height: 28),
//
//             CustomElevatedButton(
//               buttonName: 'Done',
//               onPressed: () {
//                 context.pop();
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
void showFilterBottomSheet(BuildContext context) {
  final recommendationCubit = context.read<RecommendationCubit>();

  showModalBottomSheet(
    context: context,

    isScrollControlled: true,

    backgroundColor: Colors.transparent,

    builder: (_) {
      return BlocProvider.value(
        value: recommendationCubit,

        child: Builder(
          builder: (context) {
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

                  const Divider(),

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

                    child:
                        BlocBuilder<RecommendationCubit, RecommendationState>(
                          builder: (context, state) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,

                              itemCount:
                                  recommendationCubit.categories.length + 1,

                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return filterChip(
                                    title: 'All',

                                    selected:
                                        recommendationCubit.selectIndex == 0,

                                    onSelected: () {
                                      recommendationCubit.changeIndex(0);

                                      recommendationCubit
                                          .filterDoctorsByCategory('All');

                                      context.pop();
                                    },

                                    context: context,
                                  );
                                }

                                final category =
                                    recommendationCubit.categories[index - 1];

                                return filterChip(
                                  title: category.name,

                                  selected:
                                      recommendationCubit.selectIndex == index,

                                  onSelected: () {
                                    recommendationCubit.changeIndex(index);

                                    recommendationCubit.filterDoctorsByCategory(
                                      category.id,
                                    );

                                    context.pop();
                                  },

                                  context: context,
                                );
                              },
                            );
                          },
                        ),
                  ),

                  verticalSpace(28),

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
