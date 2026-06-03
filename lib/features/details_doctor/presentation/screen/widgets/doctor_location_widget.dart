import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../home/domain/entities/doctor_entity.dart';

class DoctorLocationWidget extends StatelessWidget {
  final DoctorEntity doctor;

  const DoctorLocationWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final LatLng doctorLocation = LatLng(doctor.latitude, doctor.longitude);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        verticalSpace(5),
        Text(
          'Practice Place',

          style: AppTextStyle.styleSemiBold16(
            ColorManager.textPrimary,
            context,
          ),
        ),

        verticalSpace(7),

        Text(
          doctor.location,

          style: AppTextStyle.styleMedium16(ColorManager.primaryColor, context),
        ),

        verticalSpace(7),

        Text(
          'Location Map',

          style: AppTextStyle.styleSemiBold16(
            ColorManager.textSecondary,
            context,
          ),
        ),

        verticalSpace(16),

        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: doctorLocation,

                zoom: 14,
              ),

              markers: {
                Marker(
                  markerId: const MarkerId('doctor_location'),

                  position: doctorLocation,

                  infoWindow: InfoWindow(
                    title: doctor.name,

                    snippet: doctor.location,
                  ),
                ),
              },

              zoomControlsEnabled: false,

              myLocationButtonEnabled: false,
            ),
          ),
        ),
      ],
    );
  }
}
