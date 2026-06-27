import 'package:doctor_app/features/doctor_profile/presentation/screen/doctor_appointment/widget/appointment_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/doctor_cubit.dart';
import '../../controller/doctor_state.dart';

class DoctorAppointmentsScreen extends StatelessWidget {
  const DoctorAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocProvider(
        create: (_) => CurrentDoctorCubit()..getAppointments(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Appointments')),
          body: BlocBuilder<CurrentDoctorCubit, CurrentDoctorState>(
            builder: (context, state) {
              if (state is DoctorAppointmentsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is DoctorAppointmentsSuccess) {
                if (state.appointments.isEmpty) {
                  return const Center(child: Text('No Appointments Yet'));
                }
                final upComingAppointments = state.appointments
                    .where((e) => e.status.name == 'upcoming')
                    .toList();

                final completedAppointments = state.appointments
                    .where((e) => e.status.name == 'completed')
                    .toList();

                final cancelledAppointments = state.appointments
                    .where((e) => e.status.name == 'cancelled')
                    .toList();

                return Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: 'Upcoming'),
                        Tab(text: 'Completed'),
                        Tab(text: 'Cancelled'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          AppointmentListWidget(
                            appointments: upComingAppointments,
                            showActions: true,
                          ),
                          AppointmentListWidget(
                            appointments: completedAppointments,
                            showActions: false,
                          ),
                          AppointmentListWidget(
                            appointments: cancelledAppointments,
                            showActions: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
