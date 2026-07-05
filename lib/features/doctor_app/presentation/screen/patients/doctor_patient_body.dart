import 'package:doctor_app/features/doctor_app/presentation/screen/patients/widget/patient_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../controller/doctor_cubit.dart';
import '../../controller/doctor_state.dart';

class DoctorPatientBody extends StatelessWidget {
  const DoctorPatientBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentDoctorCubit, CurrentDoctorState>(
      builder: (context, state) {
        if (state is DoctorPatientsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DoctorPatientsFailure) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is DoctorPatientsSuccess) {
          if (state.patients.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 80,
                    color: ColorManager.grey60,
                  ),

                  verticalSpace(16),

                  Text(
                    'No Patients Yet',
                    style: AppTextStyle.styleBold18(
                      ColorManager.textPrimary,
                      context,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: state.patients.length,
            itemBuilder: (context, index) {
              final patient = state.patients[index];

              return PatientCard(patient: patient);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
