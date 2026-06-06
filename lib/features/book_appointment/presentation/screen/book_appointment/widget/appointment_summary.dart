import 'package:doctor_app/core/constants/app_svgs.dart';
import 'package:doctor_app/core/utils/app_router/routes.dart';
import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/features/book_appointment/domain/entities/appointment_params.dart';
import 'package:doctor_app/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/common_widgets/custom_doctor_data.dart';
import '../../../controller/book_appointment_cubit.dart';
import 'appoint_price.dart';
import '../../shared_widget/book_information_item.dart';
import '../../shared_widget/booking_information.dart';
import '../../shared_widget/custom_texts_appointment.dart';

class AppointmentSummary extends StatelessWidget {
  final DoctorEntity? dataForDoctors;

  const AppointmentSummary({super.key, required this.dataForDoctors});

  @override
  Widget build(BuildContext context) {
    final appointmentParams = AppointmentParams(
      doctor: dataForDoctors!,

      doctorId: dataForDoctors!.id,

      appointmentDate: context
          .read<BookAppointmentCubit>()
          .selectedDate
          .toString(),

      appointmentTime: context.read<BookAppointmentCubit>().selectedTime,

      appointmentType: context.read<BookAppointmentCubit>().selectedType.name,

      paymentMethod: context.read<BookAppointmentCubit>().cardType.name,

      price: dataForDoctors!.price,

      userId: Supabase.instance.client.auth.currentUser!.id,
    );

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              verticalSpace(20),

              BookingInformation(appointmentParams: appointmentParams),
              const Divider(),
              verticalSpace(20),
              buildText('Doctor Information', context),
              verticalSpace(20),
              CustomDoctorsDataWidget(doctor: dataForDoctors!),
              verticalSpace(20),
              buildText('Payment Information', context),
              verticalSpace(20),

              BookInformationItem(
                images: AppSvgs.paypal,
                title1: 'Paypal',
                title2: '***** ***** ***** 37842',
                context: context,
              ),

              verticalSpace(20),

              AppointPrice(price: dataForDoctors!.price),

              verticalSpace(20),

              CustomElevatedButton(
                buttonName: 'Book Now',

                onPressed: () {
                  context.pop();

                  context.pushNamed(
                    Routes.doneAppointments,

                    arguments: {
                      'appointmentParams': appointmentParams,
                      'button': const SizedBox.shrink(),
                      'showState': true,
                      'listener': const SizedBox.shrink(),
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
