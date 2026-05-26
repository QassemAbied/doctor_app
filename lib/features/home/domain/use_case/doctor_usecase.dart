import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entities/doctor_entity.dart';
import '../repository.dart';

class GetDoctorsUseCase {
  final HomeRepository _homeRepository;

  GetDoctorsUseCase(this._homeRepository);

  Future<Either<Failure, List<DoctorEntity>>> call() async {
    return await _homeRepository.getDoctors();
  }
}
