import 'package:doctor_app/core/helpers/extension.dart';
import 'package:doctor_app/features/details_doctor/logic/details_doctors_cubit.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/home/logic/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../data/models/home_models.dart';

class ListViewForDoctor extends StatelessWidget {
  final List<DoctorsDataModels?>? doctors;

  const ListViewForDoctor({
    super.key,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      sliver: SliverList.builder(
        // shrinkWrap: ,
        // scrollDirection: Axis.vertical,
        itemCount: doctors?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: (){
                final id = doctors?[index]?.id;

                if (id == null) return;
                context.pushNamed('/detailsDoctors',arguments: id);
               // context.read<DetailsDoctorsCubit>().emitDetailsDoctors(doctors?[index]?.id??0);
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/doctor_image.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  horizontalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctors?[index]?.name ?? '',
                        style: AppStyles.styleSemiBold16(
                          ColorManager.blackColor,
                          context,
                        ),
                      ),
                      verticalSpace(5),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${doctors?[index]?.gender} - ${doctors?[index]
                              ?.degree}',
                          style: AppStyles.styleRegular13(
                            ColorManager.geryColor,
                            context,
                          ),
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        doctors?[index]?.specialization!.name ?? '',
                        style: AppStyles.styleRegular13(
                          ColorManager.geryColor,
                          context,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
