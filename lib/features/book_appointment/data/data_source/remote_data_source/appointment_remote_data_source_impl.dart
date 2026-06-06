import 'package:doctor_app/features/book_appointment/domain/entities/appointment_params.dart';

import '../../../../../core/services/supa_base_service/book_appointment_service.dart';
import '../../model/appointment_model.dart';
import 'appointment_remote_data_source.dart';

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  final BookAppointmentService bookAppointmentService;
  AppointmentRemoteDataSourceImpl(this.bookAppointmentService);
  @override
  Future<void> createAppointment(AppointmentParams params) async {
    await bookAppointmentService.createAppointment(params);
  }

  @override
  Future<List<AppointmentModel>> getAppointment() async {
    return await bookAppointmentService.getAppointment();
  }

  @override
  Future<void> rescheduleAppointment(RescheduleAppointmentParams params) async {
    await bookAppointmentService.rescheduleAppointment(params);
  }

  @override
  Future<void> cancelAppointment(String id) async {
    await bookAppointmentService.cancelAppointment(id);
  }
}
