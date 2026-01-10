import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/features/apponitments/data/models/appointment_request.dart';
import 'package:doctor_app/features/apponitments/data/repos/appointment_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appointment_store_state.dart';

class AppointmentStoreCubit extends Cubit<AppointmentStoreState> {
  final AppointmentRepos appointmentRepos;
  AppointmentStoreCubit(this.appointmentRepos)
    : super(AppointmentStoreState.initial());

  Future emitAppointmentStore(AppointmentRequest appointmentRequest) async {
    emit(AppointmentStoreState.loading());

    final response = await appointmentRepos.appointmentStore(
      appointmentRequest,
    );

    response.when(
      success: (data) {
        emit(AppointmentStoreState.success(data));
      },
      failure: (error) {
        emit(
          AppointmentStoreState.error(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
