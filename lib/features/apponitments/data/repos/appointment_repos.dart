import 'package:doctor_app/core/network/api_services.dart';
import 'package:doctor_app/features/apponitments/data/models/appointment_request.dart';
import 'package:doctor_app/features/apponitments/data/models/appointments_response.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';

class AppointmentRepos {
  final ApiServices apiServices;
  AppointmentRepos(this.apiServices);

  Future<ApiResult<AppointmentsResponse>> appointmentStore(
    AppointmentRequest appointmentRequest,
  ) async {
    try {
      final response = await apiServices.appointmentStore(appointmentRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
