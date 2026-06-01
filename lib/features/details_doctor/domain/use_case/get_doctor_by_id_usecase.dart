import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/details_doctor/domain/repository.dart';

import '../../../../core/error/error.dart';
import '../../../home/domain/entities/doctor_entity.dart';

class GetDoctorByIdUseCase {
  final DetailsRepository _detailsRepository;

  GetDoctorByIdUseCase(this._detailsRepository);

  Future<Either<Failure, DoctorEntity>> call(String id) async {
    return await _detailsRepository.getDoctorById(id);
  }
}
