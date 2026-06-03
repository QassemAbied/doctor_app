import 'package:dartz/dartz.dart';

import '../../../core/error/error.dart';
import 'entities/appointment_params.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, void>> bookAppointment(AppointmentParams params);
}
