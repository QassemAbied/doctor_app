import 'package:doctor_app/core/helpers/extension.dart';
import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/core/widgets/app_text_button_widget.dart';
import 'package:doctor_app/features/details_doctor/logic/details_doctors_cubit.dart';
import 'package:doctor_app/features/details_doctor/logic/details_doctors_state.dart';
import 'package:doctor_app/features/details_doctor/view/widgets/about_tab_bar_widget.dart';
import 'package:doctor_app/features/details_doctor/view/widgets/doctor_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/di/dependey.dart';

class DetailsDoctorsScreen extends StatefulWidget {
  final int idDoctors;
  const DetailsDoctorsScreen({super.key, required this.idDoctors});

  @override
  State<DetailsDoctorsScreen> createState() => _DetailsDoctorsScreenState();
}

class _DetailsDoctorsScreenState extends State<DetailsDoctorsScreen> {
  // bool locationLoaded = false;
  // LatLng? doctorLocation;
   late CameraPosition initialCameraPosition;

   @override
  void initState() {
     initialCameraPosition= CameraPosition(
       target: LatLng(29.07135394674241, 31.104740441335462),
       zoom: 16,
     );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recommendation Doctor',
            style: AppStyles.styleBold18(ColorManager.blackColor, context),),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: BlocProvider(
            create: (context) =>
                getIt<DetailsDoctorsCubit>()..emitDetailsDoctors(widget.idDoctors),
            child: BlocBuilder<DetailsDoctorsCubit, DetailsDoctorsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return CircularProgressIndicator();
                  },
                  success: (dataForDoctors) {
                    final cityName = dataForDoctors?.city?.name;           // New Idellbury
                    final governorateName = dataForDoctors?.city?.governrate?.name;
                    return Column(
                      children: [
                        DoctorsDataWidget(dataForDoctors: dataForDoctors,),
                        verticalSpace(20.0),
                        TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: ColorManager.mainBlueColor,
                          dividerColor: ColorManager.geryColor,
                          indicatorColor: ColorManager.mainBlueColor,
                          tabs: [
                            Tab(text: 'About'),
                            Tab(text: 'Location'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                          //  physics: BouncingScrollPhysics(),
                            children: [
                              AboutTabBarWidget(dataForDoctors: dataForDoctors,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cityName??'',
                                    style: AppStyles.styleSemiBold16(
                                      ColorManager.blackColor,
                                      context,
                                    ),
                                  ),
                                  verticalSpace(5.0),
                                  Text(
                                    governorateName??'',
                                    style: AppStyles.styleSemiBold16(
                                      ColorManager.blackColor,
                                      context,
                                    ),
                                  ),
                                  verticalSpace(10.0),
                                  Expanded(child: _buildMap()),
                              
                                ],
                              ),
                            ],
                          ),
                        ),
                        AppTextButtonWidget(
                          buttonName: 'Make An Appointment',
                          onPressed: () {
                            context.pushNamed('/appointments',
                                arguments:dataForDoctors ,

                            );
                          },
                        ),
                      ],
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
          ),
        ),
      ),
    );
  }



  Widget _buildMap() {


    return GoogleMap(
      initialCameraPosition:initialCameraPosition,
      markers: {
        Marker(
          markerId: const MarkerId('clinic'),
          position:LatLng(29.07135394674241, 31.104740441335462),
        ),
      },
    //  zoomControlsEnabled: false,
    );
  }



}

