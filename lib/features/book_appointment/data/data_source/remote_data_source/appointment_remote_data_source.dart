import '../../../domain/entities/appointment_params.dart';

abstract class AppointmentRemoteDataSource {
  Future<void> createAppointment(AppointmentParams params) ;
}