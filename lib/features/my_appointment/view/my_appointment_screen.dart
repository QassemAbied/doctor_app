import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/features/my_appointment/logic/my_appointment_cubit.dart';
import 'package:doctor_app/features/my_appointment/logic/my_appointment_state.dart';
import 'package:doctor_app/features/my_appointment/view/widget/list_view_my_appointments.dart';
import 'package:doctor_app/features/my_appointment/view/widget/my_appointment_is_empty.dart';
import 'package:doctor_app/features/my_appointment/view/widget/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Appointments',
          style: AppTextStyle.styleBold24(ColorManager.blackColor, context),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<MyAppointmentCubit, MyAppointmentState>(
        buildWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return ShimmerLoading();
            },
            success: (myAppointmentResponse) {
              final appointments = myAppointmentResponse.data!.reversed
                  .toList();
              return myAppointmentResponse.data!.isEmpty
                  ? MyAppointmentIsEmpty()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 30,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListViewMyAppointments(
                              myAppointmentResponse: myAppointmentResponse,
                            ),
                          ),
                        ],
                      ),
                    );
            },
            error: (error) {
              return Center(child: Text(error));
            },

            orElse: () {
              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
