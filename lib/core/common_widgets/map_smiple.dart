import 'dart:async';
import 'package:doctor_app/core/common_widgets/custom_elevated_botton.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/core/utils/app_router/routes.dart';
import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/features/home/domain/entities/doctor_entity.dart';
import 'package:doctor_app/features/home/presentation/controller/recommendation/recommendation_cubit.dart';
import 'package:doctor_app/features/home/presentation/controller/recommendation/recommendation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_text_filed.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        final cubit = context.read<RecommendationCubit>();

        if (cubit.userLat == null || cubit.userLng == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final List<DoctorEntity> doctors = state is SearchRecommendationSuccess
            ? state.searchDoctors
            : cubit.allDoctors;

        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(cubit.userLat!, cubit.userLng!),

                  zoom: 13,
                ),

                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },

                markers: {
                  Marker(
                    markerId: const MarkerId('user'),

                    position: LatLng(cubit.userLat!, cubit.userLng!),

                    infoWindow: const InfoWindow(title: 'My Location'),

                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueAzure,
                    ),
                  ),

                  ...doctors.map((doctor) {
                    final distance = (cubit.calculateDistance(doctor) / 1000)
                        .toStringAsFixed(1);

                    return Marker(
                      markerId: MarkerId(doctor.id),

                      position: LatLng(doctor.latitude, doctor.longitude),

                      infoWindow: InfoWindow(
                        title: doctor.name,

                        snippet: doctor.location,
                      ),

                      onTap: () async {
                        final GoogleMapController controller =
                            await _controller.future;

                        controller.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(doctor.latitude, doctor.longitude),

                              zoom: 15,
                            ),
                          ),
                        );

                        showDoctorBottomSheet(context, doctor, distance);
                      },
                    );
                  }).toSet(),
                },
              ),

              Positioned(
                top: 50,
                left: 16,
                right: 16,
                child: Material(
                  elevation: 5,

                  borderRadius: BorderRadius.circular(16),

                  child: AppTextField(
                    onChange: (value) {
                      context.read<RecommendationCubit>().searchDoctorsByName(
                        query: value,
                      );
                    },
                    hintText: 'Search doctor...',
                    suffix: Icon(
                      Icons.location_on_outlined,
                      color: ColorManager.primaryColor,
                      size: 25,
                    ),
                    validator: (String? p1) {},
                  ),
                ),
              ),
            ],
          ),

          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;

              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(cubit.userLat!, cubit.userLng!),

                    zoom: 13,
                  ),
                ),
              );
            },

            label: const Text('My Location'),

            icon: const Icon(Icons.my_location),
          ),
        );
      },
    );
  }

  void showDoctorBottomSheet(
    BuildContext context,
    DoctorEntity doctor,
    String distance,
  ) {
    showModalBottomSheet(
      context: context,

      backgroundColor: Colors.transparent,

      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(24),

          decoration: const BoxDecoration(
            color: ColorManager.whiteColor,

            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,

                    backgroundImage: NetworkImage(doctor.image),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          doctor.name,

                          style: AppTextStyle.styleSemiBold18(
                            ColorManager.textPrimary,

                            context,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          doctor.specializationName,

                          style: AppTextStyle.styleMedium14(
                            ColorManager.textSecondary,

                            context,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          '📍 $distance km away',

                          style: AppTextStyle.styleMedium14(
                            ColorManager.primaryColor,

                            context,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Icon(Icons.location_on),

                  const SizedBox(width: 6),

                  Expanded(child: Text(doctor.location)),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const Icon(Icons.attach_money),

                  const SizedBox(width: 6),

                  Text('${doctor.price} EGP'),
                ],
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      buttonName: 'Book Now',

                      onPressed: () {
                        context.pop();

                        context.pushNamed(
                          Routes.bookAppointmentScreen,

                          arguments: doctor,
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri uri = Uri.parse(
                          'https://www.google.com/maps/dir/?api=1&destination=${doctor.latitude},${doctor.longitude}',
                        );

                        await launchUrl(uri);
                      },

                      child: const Text('Directions'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
