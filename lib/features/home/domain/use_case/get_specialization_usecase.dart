import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/home/domain/repository.dart';
import '../../../../core/error/error.dart';
import '../entities/specialization_entity.dart';

class GetSpecializationUseCase {
  final HomeRepository _homeRepository;
  GetSpecializationUseCase(this._homeRepository);
  Future<Either<Failure, List<SpecializationEntity>>> call() async {
    return await _homeRepository.getSpecialization();
  }
}
