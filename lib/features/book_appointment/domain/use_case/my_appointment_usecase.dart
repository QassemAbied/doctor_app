import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/book_appointment/domain/entities/appointment_entity.dart';

import '../../../../core/error/error.dart';
import '../repository.dart';

class MyAppointmentUseCase {
  final AppointmentRepository appointmentRepository;
  MyAppointmentUseCase(this.appointmentRepository);
  Future<Either<Failure, List<AppointmentEntity>>> call() async {
    return await appointmentRepository.getAppointment();
  }
}
