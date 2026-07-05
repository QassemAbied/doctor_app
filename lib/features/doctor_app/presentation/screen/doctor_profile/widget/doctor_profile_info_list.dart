import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../home/domain/entities/doctor_entity.dart';
import 'doctor_profile_info_title_widget.dart';

class DoctorProfileInfoList extends StatelessWidget {
  const DoctorProfileInfoList({super.key, required this.doctor});
  final DoctorEntity doctor;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          DoctorInfoTile(
            icon: Icons.phone,
            title: 'Phone',
            value: doctor.phone,
          ),

          const Divider(height: 0),

          DoctorInfoTile(
            icon: Icons.email,
            title: 'Email',
            value: doctor.email,
          ),

          const Divider(height: 0),

          DoctorInfoTile(
            icon: Icons.location_on,
            title: 'Location',
            value: doctor.location,
          ),

          const Divider(height: 0),

          DoctorInfoTile(
            icon: Icons.school,
            title: 'Degree',
            value: doctor.degree,
          ),

          const Divider(height: 0),

          DoctorInfoTile(
            icon: Icons.account_balance,
            title: 'University',
            value: doctor.university,
          ),

          const Divider(height: 0),

          DoctorInfoTile(
            icon: Icons.language,
            title: 'Languages',
            value: doctor.languages.join(', '),
          ),

          const Divider(height: 0),

          DoctorInfoTile(
            icon: Icons.payments,
            title: 'Consultation Price',
            value: '${doctor.price} EGP',
          ),

          const Divider(height: 0),

          DoctorInfoTile(
            icon: Icons.access_time,
            title: 'Working Hours',
            value: '${doctor.openTime} - ${doctor.closeTime}',
          ),

          const Divider(height: 0),

          DoctorInfoTile(
            icon: Icons.timer,
            title: 'Waiting Time',
            value: '${doctor.waitingTime} min',
          ),

          verticalSpace(24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                verticalSpace(12),

                Text(
                  doctor.about,
                  style: const TextStyle(height: 1.6, color: Colors.grey),
                ),
              ],
            ),
          ),

          verticalSpace(30),
        ],
      ),
    );
  }
}
