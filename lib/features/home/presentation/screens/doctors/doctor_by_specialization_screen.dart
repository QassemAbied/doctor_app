import 'package:doctor_app/core/common_widgets/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/di/injection_container.dart';
import '../../controller/doctor/doctors_cubit.dart';
import '../../controller/doctor/doctors_state.dart';
import '../home/widgets/empty_doctor_widget.dart';
import '../home/widgets/item_for_doctor_widget.dart';

class DoctorBySpecializationScreen extends StatelessWidget {
  final String specializationId;

  final String specializationName;

  const DoctorBySpecializationScreen({
    super.key,

    required this.specializationId,

    required this.specializationName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(specializationName)),

      body: BlocProvider(
        create: (context) => sl<DoctorCubit>()..getDoctors(),
        child: BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, state) {
            if (state is DoctorError) {
              return Center(child: Text(state.message));
            }

            final isLoading = state is DoctorLoading;

            final doctors = state is DoctorSuccess
                ? state.doctors
                      .where(
                        (doctor) => doctor.specializationId == specializationId,
                      )
                      .toList()
                : DummyData.fakeDoctors;
            if (! isLoading && doctors.isEmpty) {
              return EmptyDoctorsWidget();
            }

            return Skeletonizer(
              enabled: isLoading,

              child: ListView.builder(
                padding: const EdgeInsets.all(16),

                itemCount: doctors.length,

                itemBuilder: (context, index) {
                  return ItemForDoctorWidget(doctors: doctors, index: index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
