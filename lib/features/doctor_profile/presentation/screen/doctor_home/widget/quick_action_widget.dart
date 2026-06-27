import 'package:doctor_app/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/app_router/routes.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../chat/presentation/screen/message_screen.dart';
import '../../common_widget/statistic_card_widget.dart';


class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: AppTextStyle.styleBold18(ColorManager.textPrimary, context),
          ),

          verticalSpace(16),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.7,
            children: [
              GestureDetector(
                onTap: () {
                 context.pushNamed(Routes.doctorAppointmentsScreen);
                },
                child: const StatisticCard(
                  value: 'Appointments',
                  icon: Icons.calendar_month,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.doctorPatientsScreen);
                },
                child: const StatisticCard(
                  value: 'Patients',
                  icon: Icons.people,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessagesScreen()),
                  );
                },
                child: StatisticCard(value: 'Chats', icon: Icons.chat),
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.doctorProfileScreen);
                },
                child: const StatisticCard(
                  value: 'Profile',
                  icon: Icons.person,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
