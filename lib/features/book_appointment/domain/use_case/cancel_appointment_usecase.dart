import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../repository.dart';

class CancelAppointmentUseCase {
  final AppointmentRepository appointmentRepository;
  CancelAppointmentUseCase(this.appointmentRepository);
  Future<Either<Failure, void>> call(String id) async {
    return await appointmentRepository.cancelAppointment(id);
  }
}
