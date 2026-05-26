import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/home/domain/entities/specialization_entity.dart';
import '../../../core/error/error.dart';
import 'entities/doctor_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<SpecializationEntity>>> getSpecialization();

  Future<Either<Failure, List<DoctorEntity>>> getDoctors();
}
