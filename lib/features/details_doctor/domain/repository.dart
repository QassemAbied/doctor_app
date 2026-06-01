import 'package:dartz/dartz.dart';

import '../../../core/error/error.dart';
import '../../home/domain/entities/doctor_entity.dart';

abstract class DetailsRepository {
  Future<Either<Failure, DoctorEntity>> getDoctorById(String id);
}
