import 'package:doctor_app/features/book_appointment/presentation/controller/book_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../../core/utils/spacing.dart';

class AllButtonInMyAppointments extends StatelessWidget {
  final String id;
  final VoidCallback onPressed;
  const AllButtonInMyAppointments({
    super.key,
    required this.id,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.read<BookAppointmentCubit>().cancelAppointment(id);
            },
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('Cancel Appointment'),
            ),
          ),
        ),
        horizontalSpace(18),
        Expanded(
          child: CustomElevatedButton(
            buttonName: 'Reschedule',
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
