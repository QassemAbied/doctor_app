import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/di/injection_container.dart';
import '../controller/doctor_details_cubit.dart';
import 'details_body.dart';

class DetailsDoctorsScreen extends StatelessWidget {
  final String doctorId;

  const DetailsDoctorsScreen({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('Doctor Details')),

        body: BlocProvider(
          create: (_) => sl<DoctorDetailsCubit>()..getDoctorById(doctorId),
          child: DetailsBody(),
        ),
      ),
    );
  }
}
