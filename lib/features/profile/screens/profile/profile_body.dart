import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/features/profile/screens/profile/widget/image_avatar_widget.dart';
import 'package:doctor_app/features/profile/screens/profile/widget/list_title_list_widget.dart';
import 'package:doctor_app/features/profile/screens/profile/widget/my_appointment_widget.dart';
import 'package:doctor_app/features/profile/screens/profile/widget/user_information_widget.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 220, width: double.infinity, color: Colors.blue),
        Column(
          children: [
            const SizedBox(height: 160),
            Expanded(
              child: Container(
                padding: EdgeInsetsGeometry.only(left: 16, right: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: ListView(
                  children: [
                    UserInformationWidget(),
                    verticalSpace(20),
                    MyAppointmentWidget(),
                    verticalSpace(20),
                    ListTitleListWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
        ImageAvatarWidget(),
      ],
    );
  }
}
