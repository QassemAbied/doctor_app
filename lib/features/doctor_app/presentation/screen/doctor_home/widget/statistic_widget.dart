import 'package:flutter/material.dart';
import '../../../../../home/domain/entities/doctor_entity.dart';
import '../../common_widget/statistic_card_widget.dart';

class StatisticEntity {
  final String title;
  final String value;
  final IconData icon;
  const StatisticEntity({
    required this.title,
    required this.value,
    required this.icon,
  });
}

class StatisticsSection extends StatelessWidget {
  StatisticsSection({super.key, required this.doctor});
  final DoctorEntity doctor;
  late final List<StatisticEntity> statistics = [
    StatisticEntity(
      title: 'Patients',
      value: doctor.patientsCount.toString(),
      icon: Icons.people,
    ),

    StatisticEntity(
      title: 'Revenue',
      value: doctor.reviewsCount.toString(),
      icon: Icons.payments,
    ),
    StatisticEntity(
      title: 'Experience Years',
      value: doctor.experienceYears.toString(),
      icon: Icons.calendar_month,
    ),
    StatisticEntity(
      title: 'Reviews',
      value: doctor.rating.toString(),
      icon: Icons.star,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GridView.count(
       shrinkWrap: true,
       physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.7,
        children: [
          for (var statistic in statistics)
            StatisticCard(
              showTitle: true,
              title: statistic.title,
              value: statistic.value,
              icon: statistic.icon,
            ),
        ],
      ),
    );
  }
}
