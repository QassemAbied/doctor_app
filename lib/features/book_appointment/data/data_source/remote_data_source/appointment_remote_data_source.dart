import '../../../domain/entities/appointment_params.dart';
import '../../model/appointment_model.dart';

abstract class AppointmentRemoteDataSource {
  Future<void> createAppointment(AppointmentParams params) ;
  Future<List<AppointmentModel>> getAppointment() ;
  Future<void> rescheduleAppointment(RescheduleAppointmentParams params) ;
  Future<void> cancelAppointment(String id) ;
}
