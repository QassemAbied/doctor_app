import 'package:doctor_app/core/common_widgets/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../controller/specialization/specialization_cubit.dart';
import '../../../controller/specialization/specialization_state.dart';
import 'item_for_specialization_widget.dart';

class ListViewForSpecialization extends StatelessWidget {
  const ListViewForSpecialization({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializationCubit, SpecializationState>(
      builder: (context, state) {
        if (state is SpecializationError) {
          return Center(child: Text(state.message));
        }

        final isLoading = state is SpecializationLoading;

        final data = state is SpecializationSuccess
            ? state.specializations
            : DummyData.fakeSpecializations;

        return Skeletonizer(
          enabled: isLoading,
          child: SizedBox(
            height: 115,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (data.length) + 1,
              itemBuilder: (context, index) {
                return ItemForSpecializationWidget(data: data, index: index);
              },
            ),
          ),
        );
      },
    );
  }
}

