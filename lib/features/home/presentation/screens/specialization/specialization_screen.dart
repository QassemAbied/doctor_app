import 'package:doctor_app/core/common_widgets/dummy_data.dart';
import 'package:doctor_app/features/home/presentation/screens/specialization/widget/item_for_specialization_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../controller/specialization/specialization_cubit.dart';
import '../../controller/specialization/specialization_state.dart';

class SpecializationScreen extends StatelessWidget {
  const SpecializationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Doctor Speciality')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: BlocBuilder<SpecializationCubit, SpecializationState>(
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

              child: GridView.builder(
                itemCount: data.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,

                  mainAxisSpacing: 20,

                  crossAxisSpacing: 20,

                  childAspectRatio: .75,
                ),

                itemBuilder: (context, index) {
                  return ItemForSpecializationGridItem(
                    specialization: data[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
