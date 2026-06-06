import 'package:doctor_app/core/utils/eunm.dart';
import 'package:doctor_app/features/book_appointment/presentation/controller/book_appointment_cubit.dart';
import 'package:doctor_app/features/book_appointment/presentation/screen/my_appointment/widget/cancelled_or_completed_widget.dart';
import 'package:doctor_app/features/book_appointment/presentation/screen/my_appointment/widget/upcoming_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/common_widgets/dummy_data.dart';
import '../../../../../core/utils/di/injection_container.dart';
import '../../controller/book_appointment_state.dart';

class MyAppointmentScreen extends StatefulWidget {
  const MyAppointmentScreen({super.key});

  @override
  State<MyAppointmentScreen> createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocProvider(
        create: (context) => sl<BookAppointmentCubit>()..getAppointment(),
        child: Scaffold(
          appBar: AppBar(title: Text('My Appointments')),
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
              ),
              BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
                builder: (context, state) {
                  if (state is AppointmentFailure) {
                    return Center(child: Text(state.message));
                  }
                  final isLoading = state is AppointmentLoading;
                  final appointments = state is AppointmentSuccess
                      ? state.appointments
                      : DummyData.fakeAppointments;

                  final upcomingAppointments = appointments
                      .where(
                        (e) => !e.isCompleted && e.status == Status.upcoming,
                      )
                      .toList();

                  final completedAppointments = appointments
                      .where((e) => e.isCompleted)
                      .toList();
                  final cancelledAppointments = appointments.reversed
                      .where((e) => e.status == Status.cancelled)
                      .toList();
                  return Expanded(
                    child: Skeletonizer(
                      enabled: isLoading,

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: TabBarView(
                          children: [
                            UpcomingWidget(appointments: upcomingAppointments),

                            CancelledOrCompletedWidget(
                              appointments: completedAppointments,

                              status: 'Appointment done',

                              colorStatus: Colors.green,
                            ),

                            CancelledOrCompletedWidget(
                              appointments: cancelledAppointments,

                              status: 'Appointment cancelled',

                              colorStatus: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
