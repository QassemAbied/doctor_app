import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';
import 'package:doctor_app/features/doctor_app/presentation/screen/patients_details/widget/header_patient_details_widget.dart';
import 'package:doctor_app/features/doctor_app/presentation/screen/patients_details/widget/statistic_patient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/doctor_cubit.dart';


class PatientDetailsScreen extends StatelessWidget {
  final UserEntity? patient;

  const PatientDetailsScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentDoctorCubit()..getPatientDetails(patient!.id),
      child: Scaffold(
        appBar: AppBar(title: const Text('Patient Details')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              HeaderPatientDetailsWidget(patient: patient),
              StatisticPatientWidget(),
            ],
          ),
        ),
      ),
    );
  }
}


