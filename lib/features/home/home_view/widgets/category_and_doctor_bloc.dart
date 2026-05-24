import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../../../core/utils/spacing.dart';
import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';
import 'list_doctor_shimmer.dart';
import 'list_view_for_category.dart';
import 'list_view_for_doctor.dart';

class CategoryAndDoctorBloc extends StatelessWidget {
  const CategoryAndDoctorBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: (){
              return ListDoctorShimmer();
            },
            success: (homeModels){
              final cubit = context.read<HomeCubit>();
              return MultiSliver(
                children:
                 [
                   SliverToBoxAdapter(
                     child: Padding(
                       padding: const  EdgeInsets.only(
                       //top: 10.0,
                       left: 30,
                       right: 30,
                       bottom: 10,
                     ),
                       child: Column(
                         children: [
                           ListViewForCategory(
                             data: cubit.categories,

                            ),
                           verticalSpace(10),

                         ],
                       ),
                     ),
                   ),


               ListViewForDoctor(
              doctors: homeModels,
              ),

                ],

              );
            },
            error: (message){
              return SliverToBoxAdapter(child: Center(child: Text(message)));
            }, orElse: () {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
        );

      },
    );
  }
}
