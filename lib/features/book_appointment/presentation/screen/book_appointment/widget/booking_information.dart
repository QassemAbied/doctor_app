import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/constants/app_svgs.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../domain/entities/appointment_params.dart';
import 'book_information_item.dart';
import 'custom_texts_appointment.dart';

class BookingInformation extends StatelessWidget {
  final AppointmentParams appointmentParams;

  const BookingInformation({super.key, required this.appointmentParams});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        buildText(
          'Booking Information',
          context
        ),

        verticalSpace(20),

        BookInformationItem(
          images: AppSvgs.icon,

          title1: 'Date & Time',

          title2: DateFormat(
            'EEEE, dd MMM',
          ).format(DateTime.parse(appointmentParams.appointmentDate)),

          title3: appointmentParams.appointmentTime,

          context: context,
        ),

        verticalSpace(10),

        Divider(),

        verticalSpace(10),

        BookInformationItem(
          images: AppSvgs.icon,

          title1: 'Appointment Type',

          title2: appointmentParams.appointmentType,

          context: context,
        ),
      ],
    );
  }
}
