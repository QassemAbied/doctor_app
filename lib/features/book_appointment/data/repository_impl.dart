import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/book_appointment/domain/entities/appointment_params.dart';
import '../../../core/error/error.dart';
import '../domain/entities/appointment_entity.dart';
import '../domain/mapper/appointment_mapper.dart';
import '../domain/repository.dart';
import 'data_source/remote_data_source/appointment_remote_data_source.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource appointmentRemoteDataSource;
  AppointmentRepositoryImpl(this.appointmentRemoteDataSource);
  @override
  Future<Either<Failure, void>> bookAppointment(
    AppointmentParams params,
  ) async {
    try {
      await appointmentRemoteDataSource.createAppointment(params);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getAppointment() async {
    try {
      final appointments = await appointmentRemoteDataSource.getAppointment();
      return Right(AppointmentMapper.toEntityList(appointments));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> rescheduleAppointment(RescheduleAppointmentParams params) async {
    try {
      await appointmentRemoteDataSource.rescheduleAppointment(params);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelAppointment(String id) async {
    try {
      await appointmentRemoteDataSource.cancelAppointment(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
