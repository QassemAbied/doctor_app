import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../data/models/appointment_data_time_models.dart';
import '../../logic/appointment_data_cubit.dart';
import 'book_information_item.dart';

class BookingInformation extends StatelessWidget {
  const BookingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppointmentCubit, AppointmentData>(
      builder: (context, state) {
        if (state.date == null || state.time == null) {
          return const SizedBox(); // أو Loader
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Information',
              style: AppStyles.styleSemiBold16(
                ColorManager.blackColor,
                context,
              ),
            ),
            verticalSpace(20),
            BookInformationItem(
              images: 'assets/svgs/Icon.svg',
              title1: 'Date & Time',
              title2: DateFormat('EEEE, dd MMM')
                  .format(state.date!),
              title3: state.time ?? '',
              context: context,
            ),
            verticalSpace(10),
            Divider(),
            verticalSpace(10),
            BookInformationItem(
                images: 'assets/svgs/Icon.svg',
                title1: 'Appointment Type',
                title2: state.type?.name ?? '', context: context
            ),
          ],
        );
      },
    );
  }


}
