import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../controller/doctor_cubit.dart';
import '../../../controller/doctor_state.dart';
import 'appointment_history_widget.dart';
import 'buttons_widget.dart';

class StatisticPatientWidget extends StatelessWidget {
  const StatisticPatientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentDoctorCubit, CurrentDoctorState>(
      builder: (context, state) {
        if (state is! PatientDetailsSuccess) {
          return const SizedBox();
        }

        final appointmentsCount = state.appointments.length;

        final lastVisit = state.appointments.isNotEmpty
            ? state.appointments.first.appointmentDate
                  .toString()
                  .split(' ')
                  .first
            : 'No Visits';

        final totalSpent = state.appointments
            .where((e) => e.status.name == 'completed')
            .fold<double>(0, (sum, item) => sum + (item.price));

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    title: 'Appointments',
                    value: '$appointmentsCount',
                    icon: Icons.calendar_month,
                  ),
                ),

                horizontalSpace(12),
                Expanded(
                  child: _InfoCard(
                    title: 'Total Spent',
                    value: '${totalSpent.toInt()} EGP',
                    icon: Icons.payments,
                  ),
                ),

                Expanded(
                  child: _InfoCard(
                    title: 'Last Visit',
                    value: lastVisit,
                    icon: Icons.history,
                  ),
                ),
              ],
            ),
            ButtonsWidget(),
            AppointmentHistoryWidget(appointments: state.appointments),

          ],
        );
      },
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: ColorManager.primaryColor),

          verticalSpace(8),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppTextStyle.styleBold18(
                ColorManager.textPrimary,
                context,
              ),
            ),
          ),

          verticalSpace(4),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: AppTextStyle.styleRegular14(
                ColorManager.textSecondary,
                context,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
