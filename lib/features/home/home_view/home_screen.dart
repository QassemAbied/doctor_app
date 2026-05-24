import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/features/home/data/models/home_models.dart';
import 'package:doctor_app/features/home/home_view/widgets/banner_from_home.dart';
import 'package:doctor_app/features/home/home_view/widgets/category_and_doctor_bloc.dart';
import 'package:doctor_app/features/home/home_view/widgets/doctors_bloc_builder.dart';
import 'package:doctor_app/features/home/home_view/widgets/list_doctor_shimmer.dart';
import 'package:doctor_app/features/home/home_view/widgets/list_view_for_category.dart';
import 'package:doctor_app/features/home/home_view/widgets/list_view_for_doctor.dart';
import 'package:doctor_app/features/home/home_view/widgets/row_text_textbutton.dart';
import 'package:doctor_app/features/home/home_view/widgets/welcome_message_from_home.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/home/logic/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: Column(
                children: [
                  WelcomeMessagesFromHome(),
                  BannerFromHome(),
                  RowTextTextButton(
                      text: 'Doctor Speciality',
                      tap: () {}),
                  verticalSpace(10),
              // RowTextTextButton(
              //                text: 'Recommendation Doctor',
              //                tap: () {
              //                  //context.read<HomeCubit>().emitHomeCubit();
              //                  context.pushNamed('/allDoctors');
              //                  // final homeCubit = context.read<HomeCubit>();
              //                  // homeCubit.emitHomeCubit();
              //                  // Navigator.push(
              //                  //   context,
              //                  //   MaterialPageRoute(
              //                  //     builder: (_) => BlocProvider.value(
              //                  //       value: homeCubit,
              //                  //       child: AllDoctorsView(),
              //                  //     ),
              //                  //   ),
              //                  // );
              //                },
              //              ),
                  //  CategoryAndDoctorBloc(),
                ],
              ),
            ),
          ),
         CategoryAndDoctorBloc(),
        // SliverToBoxAdapter(child: ListDoctorShimmer())
         //DoctorsBlocBuilder(),
        ],
      ),
    );
  }
}
