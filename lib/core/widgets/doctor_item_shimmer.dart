import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../helpers/spacing.dart';
import '../theming/app_color.dart';

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