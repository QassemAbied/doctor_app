import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/doctor_entity.dart';
import '../../../controller/doctor/doctors_cubit.dart';
import '../../../controller/doctor/doctors_state.dart';
import '../../home/widgets/empty_doctor_widget.dart';
import '../../home/widgets/item_for_doctor_widget.dart';

class SearchItemsWidget extends StatelessWidget {
  const SearchItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is DoctorError) {
          return SliverToBoxAdapter(child: Text(state.message));
        }

        final List<DoctorEntity> data;

        if (state is SearchDoctorSuccess) {
          data = state.searchDoctors;
        } else if (state is DoctorSuccess) {
          data = state.doctors;
        } else {
          data = [];
        }

        if (data.isEmpty) {
          return const SliverToBoxAdapter(child: EmptyDoctorsWidget());
        }

        return SliverPadding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),

          sliver: SliverList.builder(
            itemCount: data.length,

            itemBuilder: (context, index) {
              return ItemForDoctorWidget(doctors: data, index: index);
            },
          ),
        );
      },
    );
  }
}
