import 'package:doctor_app/features/doctor_profile/presentation/screen/patients/doctor_patient_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/doctor_cubit.dart';

class DoctorPatientsScreen extends StatelessWidget {
  const DoctorPatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CurrentDoctorCubit()..getPatients(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Patients')),
          body:  DoctorPatientBody(),
        ),
      ),
    );
  }
}


