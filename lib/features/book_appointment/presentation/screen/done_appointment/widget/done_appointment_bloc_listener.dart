import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/app_router/routes.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../controller/book_appointment_cubit.dart';
import '../../../controller/book_appointment_state.dart';

class DoneAppointmentBlocListener extends StatelessWidget {
  const DoneAppointmentBlocListener({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookAppointmentCubit, BookAppointmentState>(
      listenWhen: (previous, current) =>
          current is BookAppointmentLoading || current is BookAppointmentSuccess || current is BookAppointmentFailure,
      listener: (context, state) {
        if (state is BookAppointmentLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        }
        if (state is BookAppointmentSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.bottonNavScreen);
        }
        if (state is BookAppointmentFailure) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(content: Text(state.message));
            },
          );
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
