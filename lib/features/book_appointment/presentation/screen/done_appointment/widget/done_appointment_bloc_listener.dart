import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/dialog/custom_dialog_widget.dart';
import '../../../../../../core/utils/app_router/routes.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../notification/domain/entity/local_notification_params.dart';
import '../../../../../notification/presentation/controller/notification_cubit.dart';
import '../../../controller/book_appointment_cubit.dart';
import '../../../controller/book_appointment_state.dart';

class DoneAppointmentBlocListener extends StatelessWidget {
  const DoneAppointmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookAppointmentCubit, BookAppointmentState>(
      listenWhen: (previous, current) =>
          current is BookAppointmentLoading ||
          current is BookAppointmentSuccess ||
          current is BookAppointmentFailure,
      listener: (context, state) {
        print(
          'STATE => $state',
        );
        if (state is BookAppointmentLoading) {
          CustomDialogWidget.circleDialog(context);
        }
        if (state is BookAppointmentSuccess) {
          context.pop();

          context.pushNamedAndRemoveUntil(Routes.bottonNavScreen, arguments: 0);


        }
        if (state is BookAppointmentFailure) {
          context.pop();
          CustomDialogWidget.errorDialog(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
