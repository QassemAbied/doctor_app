import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/book_appointment/domain/entities/appointment_params.dart';
import '../../../core/error/error.dart';
import '../domain/repository.dart';
import 'data_source/remote_data_source/appointment_remote_data_source.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource appointmentRemoteDataSource;
  AppointmentRepositoryImpl(this.appointmentRemoteDataSource);
  @override
  Future<Either<Failure, void>> bookAppointment(AppointmentParams params) async {
    try {
      await appointmentRemoteDataSource.createAppointment(params);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
