import 'package:doctor_app/features/doctor_profile/presentation/screen/doctor_profile/widget/doctor_profile_header_widget.dart';
import 'package:doctor_app/features/doctor_profile/presentation/screen/doctor_profile/widget/doctor_profile_info_list.dart';
import 'package:doctor_app/features/doctor_profile/presentation/screen/doctor_profile/widget/doctor_profile_statistic_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/dialog/custom_dialog_widget.dart';
import '../../../../../core/utils/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/doctor_cubit.dart';
import '../../controller/doctor_state.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CurrentDoctorCubit()..getDoctorData(),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
        body: BlocBuilder<CurrentDoctorCubit, CurrentDoctorState>(
          builder: (context, state) {
            if (state is CurrentDoctorLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CurrentDoctorFailure) {
              return Center(child: Text(state.message));
            }

            if (state is CurrentDoctorSuccess) {
              final doctor = state.doctor;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    DoctorProfileHeader(doctor: doctor),
                    verticalSpace(24),
                    DoctorStatisticsWidget(
                      patients: doctor.patientsCount,
                      reviews: doctor.reviewsCount,
                      experience: doctor.experienceYears,
                    ),
                    verticalSpace(28),
                    DoctorProfileInfoList(doctor: doctor),
                    verticalSpace(28),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit Profile'),
                      ),
                    ),

                    verticalSpace(16),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: OutlinedButton.icon(
                        onPressed: () async{
                          CustomDialogWidget.logOutDialog(context, );
                        },
                        icon: const Icon(Icons.logout),
                        label: const Text('Logout'),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}




