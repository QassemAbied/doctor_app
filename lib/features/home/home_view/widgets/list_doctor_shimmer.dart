import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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


class DoctorItemShimmer extends StatelessWidget {
  const DoctorItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          /// Doctor Image
          Shimmer.fromColors(
            baseColor: ColorManager.lighterGeryColor,
            highlightColor: Colors.white,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          horizontalSpace(10),

          /// Doctor Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _shimmerLine(width: 120),
              verticalSpace(8),
              _shimmerLine(width: 160),
              verticalSpace(8),
              _shimmerLine(width: 80),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerLine({required double width}) {
    return Shimmer.fromColors(
      baseColor: ColorManager.lighterGeryColor,
      highlightColor: Colors.white,
      child: Container(
        height: 14,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}