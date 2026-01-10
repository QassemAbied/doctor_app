import 'package:doctor_app/features/home/home_view/widgets/list_view_for_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/home_models.dart';
import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: (){
              return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
            },
            success: (doctors){
              final filteredDoctors = doctors
                  .where((d) => d.specialization?.id == 1)
                  .toList();
              // int? selectedCategoryId;
              // List<DoctorsDataModels> filteredDoctors(
              //     List<DoctorsDataModels> doctors,
              //     ) {
              //   if (selectedCategoryId == null) {
              //     return doctors; // All
              //   }
              //
              //   return doctors
              //       .where(
              //         (doctor) => doctor.specialization?.id == selectedCategoryId,
              //   )
              //       .toList();
              // }
             // final doctorsToShow = filteredDoctors(doctors);

              return ListViewForDoctor(doctors: filteredDoctors);
            },
            error: (error){
              return SliverToBoxAdapter(child: Text('error'));
            },
            orElse: (){
              return SliverToBoxAdapter(child: SizedBox.shrink());
            }


        );

      },
    );
  }
}
