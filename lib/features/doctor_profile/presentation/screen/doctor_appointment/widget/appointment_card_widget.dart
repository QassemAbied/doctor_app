import 'package:doctor_app/core/common_widgets/custom_elevated_botton.dart';
import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';
import 'package:doctor_app/features/book_appointment/domain/entities/appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/custom_image_or_name_widget.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../chat/presentation/screen/chat/chat_screen.dart';
import '../../../controller/doctor_cubit.dart';
import 'bulid_dialoge.dart';

class AppointmentCardWidget extends StatelessWidget {
  final List<AppointmentEntity> appointments;
  final int index;
  final bool showActions;

  const AppointmentCardWidget({
    super.key,
    required this.appointments,
    required this.showActions,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final patient = appointments[index].user;
    final status = appointments[index].status;

    Color bgColor;
    Color textColor;

    switch (status.name) {
      case 'completed':
        bgColor = Colors.green.shade100;
        textColor = Colors.green;
        break;

      case 'cancelled':
        bgColor = Colors.red.shade100;
        textColor = Colors.red;
        break;

      default:
        bgColor = ColorManager.primary20;
        textColor = ColorManager.primaryColor;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorManager.blackColor.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomImageOrNameWidget(
                name: patient?.name ?? '',
                image: patient?.image ?? '',
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patient?.name ?? 'Patient',
                      style: AppTextStyle.styleBold16(
                        ColorManager.textPrimary,
                        context,
                      ),
                    ),

                    verticalSpace(4),

                    Text(
                      patient?.phone ?? '',
                      style: AppTextStyle.styleRegular14(
                        ColorManager.textSecondary,
                        context,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status.name,
                  style: AppTextStyle.styleMedium14(textColor, context),
                ),
              ),
            ],
          ),
          verticalSpace(8),
          buildDetails(
            Icons.access_time,
            appointments[index].appointmentTime,
            context,
          ),
          verticalSpace(8),
          buildDetails(
            Icons.calendar_today,
            appointments[index].appointmentDate.toString().split(' ').first,
            context,
          ),
          verticalSpace(8),
          buildDetails(
            Icons.credit_card,
            appointments[index].paymentMethod,
            context,
          ),
          verticalSpace(8),
          buildDetails(
            Icons.medical_services_outlined,
            appointments[index].appointmentType,
            context,
          ),
          verticalSpace(8),

          Text(
            '#${appointments[index].id.toString().substring(0, 8)}',
            style: AppTextStyle.styleRegular12(
              ColorManager.textSecondary,
              context,
            ),
          ),

          verticalSpace(16),

          messageAndCall(context, patient),
          verticalSpace(16),
          if (showActions) cancelAndComplete(context, appointments, index),
        ],
      ),
    );
  }
}



Row messageAndCall(BuildContext context, UserEntity? patient) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  receiverId: patient!.id,
                  doctorName: patient.name,
                ),
              ),
            );
          },
          icon: const Icon(Icons.chat_bubble_outline),
          label: const Text('Message'),
        ),
      ),

      horizontalSpace(12),

      Expanded(
        child: OutlinedButton.icon(
          onPressed: () async {
            final phone = patient?.phone;

            if (phone != null) {
              // launchUrl(
              // Uri.parse('tel:$phone'),
              // );
            }
          },
          icon: const Icon(Icons.call),
          label: const Text('Call'),
        ),
      ),
    ],
  );
}

Row buildDetails(IconData icon, String text, BuildContext context) {
  return Row(
    children: [
      Icon(icon, size: 22, color: ColorManager.primary60),

      horizontalSpace(10),

      Text(
        text,
        style: AppTextStyle.styleMedium14(ColorManager.textPrimary, context),
      ),
    ],
  );
}

Row cancelAndComplete(
  BuildContext context,
  List<AppointmentEntity> appointments,
  int index,
) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () async {
            final result = await showConfirmationDialog(
              context,
              'Are you sure you want to cancel this appointment?',
              'Cancel Appointment',
            );
            if (!context.mounted) return;
            if (result == true) {
              context.read<CurrentDoctorCubit>().cancelAppointment(
                appointments[index].id,
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Appointment Cancelled')),
              );
            }
          },
          child: const Text('Cancel'),
        ),
      ),

      horizontalSpace(12),

      Expanded(
        child: CustomElevatedButton(
          buttonName: 'Complete',
          onPressed: () async {
            final result = await showConfirmationDialog(
              context,
              'Are you sure you want to complete this appointment?',
              'Complete Appointment',
            );
            if (!context.mounted) return;
            if (result == true) {
              context.read<CurrentDoctorCubit>().completeAppointment(
                appointments[index].id,
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Appointment Completed')),
              );
            }
          },
        ),
      ),
    ],
  );
}
