import 'package:doctor_app/features/doctor_app/presentation/screen/doctor_home/widget/doctor_header_widget.dart';
import 'package:doctor_app/features/doctor_app/presentation/screen/doctor_home/widget/quick_action_widget.dart';
import 'package:doctor_app/features/doctor_app/presentation/screen/doctor_home/widget/statistic_widget.dart';
import 'package:doctor_app/features/doctor_app/presentation/screen/doctor_home/widget/today_appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../controller/doctor_cubit.dart';
import '../../controller/doctor_state.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CurrentDoctorCubit, CurrentDoctorState>(
          builder: (context, state) {
            if (state is CurrentDoctorLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CurrentDoctorFailure) {
              return Center(child: Text(state.message));
            }

            if (state is CurrentDoctorSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: ColorManager.primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                    pinned: true,
                    floating: true,
                    snap: true,
                    centerTitle: true,
                    expandedHeight: 150,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      titlePadding: EdgeInsets.all(10),
                      title: Text(
                        'Dr. ${state.doctor.name}',
                        style: AppTextStyle.styleBold18(
                          ColorManager.primary20,
                          context,
                        ),
                      ),
                      background: DoctorHeaderWidget(doctor: state.doctor),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: StatisticsSection(doctor: state.doctor),
                  ),
                  SliverToBoxAdapter(
                    child: TodayAppointmentsSection(
                      appointment: state.todayAppointments,
                    ),
                  ),
                  SliverToBoxAdapter(child: QuickActionsSection()),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
