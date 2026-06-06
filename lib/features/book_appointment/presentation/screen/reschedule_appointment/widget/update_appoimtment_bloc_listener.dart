import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/dialog/custom_dialog_widget.dart';
import '../../../../../../core/utils/app_router/routes.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../controller/book_appointment_cubit.dart';
import '../../../controller/book_appointment_state.dart';

class UpdateAppointmentBlocListener extends StatelessWidget {
  const UpdateAppointmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookAppointmentCubit, BookAppointmentState>(
      listenWhen: (previous, current) =>
          current is RescheduleAppointmentLoading ||
          current is RescheduleAppointmentSuccess ||
          current is RescheduleAppointmentFailure,
      listener: (context, state) {
        if (state is RescheduleAppointmentLoading) {
          CustomDialogWidget.circleDialog(context);
        }
        if (state is RescheduleAppointmentSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.bottonNavScreen, arguments: 3);
        }
        if (state is RescheduleAppointmentFailure) {
          context.pop();
          CustomDialogWidget.errorDialog(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
