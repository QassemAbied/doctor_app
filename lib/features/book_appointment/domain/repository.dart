import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/book_appointment/domain/entities/appointment_entity.dart';

import '../../../core/error/error.dart';
import 'entities/appointment_params.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, void>> bookAppointment(AppointmentParams params);
  Future<Either<Failure, List<AppointmentEntity>>> getAppointment();
  Future<Either<Failure, void>> rescheduleAppointment(RescheduleAppointmentParams params);
  Future<Either<Failure, void>> cancelAppointment(String id);

}
