import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/book_appointment/domain/repository.dart';
import '../../../../core/error/error.dart';
import '../entities/appointment_params.dart';

class BookAppointmentUseCase {
  final AppointmentRepository appointmentRepository;
  BookAppointmentUseCase(this.appointmentRepository);
  Future<Either<Failure, void>> call(AppointmentParams params) async {
    return await appointmentRepository.bookAppointment(params);
  }
}
