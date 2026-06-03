import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../core/common_widgets/dummy_data.dart';
import '../../../controller/doctor/doctors_cubit.dart';
import '../../../controller/doctor/doctors_state.dart';
import 'empty_doctor_widget.dart';
import 'item_for_doctor_widget.dart';

class ListViewForDoctor extends StatelessWidget {
  const ListViewForDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is DoctorError) {
          return SliverToBoxAdapter(child: Text(state.message));
        }
        final isLoading = state is DoctorLoading;
        final data = state is DoctorSuccess
            ? state.doctors
            : DummyData.fakeDoctors;
        if (! isLoading && data.isEmpty) {
          return SliverToBoxAdapter(
            child: EmptyDoctorsWidget(),
          );
        }

        return SliverSkeletonizer(
          enabled: isLoading,
          ignoreContainers: true,
          child: SliverPadding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
            sliver: SliverList.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ItemForDoctorWidget(doctors: data, index: index);
              },
            ),
          ),
        );
      },
    );
  }
}
