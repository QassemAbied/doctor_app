import 'package:doctor_app/features/apponitments/view/widgets/appoint_price.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../details_doctor/data/models/details_doctors_models.dart';
import '../../../details_doctor/view/widgets/doctor_data.dart';
import 'book_information_item.dart';
import 'booking_information.dart';

class AppointmentSummary extends StatefulWidget {
  final DataForDoctors? dataForDoctors;

  const AppointmentSummary({super.key, required this.dataForDoctors});

  @override
  State<AppointmentSummary> createState() => _AppointmentSummaryState();
}

class _AppointmentSummaryState extends State<AppointmentSummary> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              BookingInformation(),
              Divider(),
              verticalSpace(20),
              Text(
                'Doctor Information',
                style: AppStyles.styleSemiBold16(
                  ColorManager.blackColor,
                  context,
                ),
              ),
              verticalSpace(20),
              DoctorsDataWidget(
                dataForDoctors: widget.dataForDoctors,
              ),
              verticalSpace(20),
              Text(
                'Payment Information',
                style: AppStyles.styleSemiBold16(
                  ColorManager.blackColor,
                  context,
                ),
              ),
              verticalSpace(20),
              BookInformationItem(
                images: 'assets/svgs/paypal.svg',
                title1: 'Paypal',
                title2: '***** ***** ***** 37842', context: context,
              ),
              verticalSpace(20),
             AppointPrice(),
            ],
          ),
        ),
      ],
    );


  }


}


