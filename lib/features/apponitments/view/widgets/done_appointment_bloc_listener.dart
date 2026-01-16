import 'package:doctor_app/features/apponitments/logic/appointment_store_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependey.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/routing/routes.dart';
import '../../../details_doctor/data/models/details_doctors_models.dart';
import '../../../my_appointment/logic/my_appointment_cubit.dart';
import '../../logic/appiotment_store_cubit.dart';

class DoneAppointmentBlocListener extends StatelessWidget {
  final DataForDoctors? dataForDoctors;
  const DoneAppointmentBlocListener({super.key, this.dataForDoctors, });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentStoreCubit, AppointmentStoreState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            return showDialog(
              context: context,
              builder: (context) {
                return Center(child: CircularProgressIndicator());
              },
            );
          },
          success: (value) {
            getIt<MyAppointmentCubit>().emitMyAppointment();
            context.navigatorPop();
            return context.pushNamed(
              Routes.detailsDoctorsScreen,
              arguments: dataForDoctors?.id,
              //(_) => false,
            );

            // return context.pushNamedAndRemoveUntil(
            //   Routes.bottonNavScreen,
            //  // arguments: dataForDoctors?.id,
            //      (_) => false,
            // );
          },
          error: (value) {
            context.navigatorPop();
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: Text(value));
              },
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
