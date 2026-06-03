import 'package:doctor_app/core/utils/app_router/routes.dart';
import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/features/details_doctor/presentation/screen/widgets/about_tab_bar_widget.dart';
import 'package:doctor_app/features/details_doctor/presentation/screen/widgets/doctor_data.dart';
import 'package:doctor_app/features/details_doctor/presentation/screen/widgets/doctor_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../core/common_widgets/dummy_data.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../controller/doctor_details_cubit.dart';
import '../controller/doctor_details_state.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsError) {
          return Center(child: Text(state.message));
        }
        final isLoading = state is DoctorDetailsLoading;
        final doctor = state is DoctorDetailsSuccess
            ? state.doctor
            : DummyData.fakeDetailsDoctor;
        return Skeletonizer(
          enabled: isLoading,
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [
                DoctorsDataWidget(doctor: doctor),

                TabBar(
                  indicatorColor: Colors.transparent,
                  labelColor: ColorManager.primaryColor,
                  unselectedLabelColor: ColorManager.grey80,
                  labelStyle: AppTextStyle.styleBold16(
                    ColorManager.primaryColor,
                    context,
                  ),
                  unselectedLabelStyle: AppTextStyle.styleMedium16(
                    ColorManager.grey80,
                    context,
                  ),
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                  dividerColor: ColorManager.grey50,

                  tabs: [
                    Tab(text: 'About'),
                    Tab(text: 'Location'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      AboutDoctorWidget(doctor: doctor),

                      DoctorLocationWidget(doctor: doctor),
                    ],
                  ),
                ),
                verticalSpace(20),

                CustomElevatedButton(
                  buttonName: 'Make An Appointment',
                  onPressed: () {
                    context.pushNamed(
                      Routes.bookAppointmentScreen,
                      arguments: doctor,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
