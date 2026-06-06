import 'package:doctor_app/core/utils/app_router/routes.dart';
import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/features/home/presentation/screens/home/widgets/banner_from_home.dart';
import 'package:doctor_app/features/home/presentation/screens/home/widgets/list_view_for_doctor.dart';
import 'package:doctor_app/features/home/presentation/screens/home/widgets/list_view_for_specialization.dart';
import 'package:doctor_app/features/home/presentation/screens/home/widgets/row_text_textbutton.dart';
import 'package:doctor_app/features/home/presentation/screens/home/widgets/welcome_message_from_home.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    WelcomeMessagesFromHome(),
                    BannerFromHome(),

                    RowTextTextButton(
                      text: 'Doctor Speciality',
                      tap: () {
                        context.pushNamed(Routes.specializationScreen);
                      },
                    ),
                    ListViewForSpecialization(),
                    RowTextTextButton(
                      text: 'Recommendation Doctor',
                      tap: () {
                        context.pushNamed(Routes.recommendationDoctorScreen, arguments: true);
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListViewForDoctor(),
          ],
        ),
      ),
    );
  }
}
