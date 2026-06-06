import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entities/appointment_params.dart';
import '../repository.dart';

class RescheduleAppointmentUesCase {
  final AppointmentRepository appointmentRepository;
  RescheduleAppointmentUesCase(this.appointmentRepository);
  Future<Either<Failure, void>> call(
      RescheduleAppointmentParams params,
      ) async {
    return await appointmentRepository.rescheduleAppointment(params);
  }
}