import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/common_widgets/doctor_item_shimmer.dart';


class ListDoctorShimmer extends StatelessWidget {
  const ListDoctorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
  return  SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverList.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const DoctorItemShimmer();
        },
      ),
    );
    // return Column(
    //   children: List.generate(5, (index){
    //     return Row(
    //       children: [
    //       Shimmer.fromColors(
    //           baseColor: Colors.red,
    //           highlightColor: Colors.orange,
    //           child: Container(
    //             height: 100,
    //             width: 70,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //           ),
    //       ),
    //         horizontalSpace(20),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Shimmer.fromColors(
    //               baseColor: ColorManager.lighterGeryColor,
    //               highlightColor: Colors.white,
    //               child: Container(
    //                 height: 20,
    //                 width: 90,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(5),
    //                 ),
    //               ),
    //             ),
    //             verticalSpace(10),
    //             Shimmer.fromColors(
    //               baseColor: ColorManager.lighterGeryColor,
    //               highlightColor: Colors.white,
    //               child: Container(
    //                 height: 20,
    //                 width: 150,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(5),
    //                 ),
    //               ),
    //             ),
    //             verticalSpace(10),
    //             Shimmer.fromColors(
    //               baseColor: ColorManager.lighterGeryColor,
    //               highlightColor: Colors.white,
    //               child: Container(
    //                 height: 20,
    //                 width: 50,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(5),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     );
    //   } ),
    // );
  }
}


