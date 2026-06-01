import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/error/error.dart';
import 'package:doctor_app/features/details_doctor/domain/repository.dart';
import 'package:doctor_app/features/home/domain/entities/doctor_entity.dart';
import '../../home/domain/mapper/doctor_mapper.dart';
import 'data_source/remote_data_source/details_remote_data_source.dart';

class DetailsRepositoryImpl implements DetailsRepository {
  final DetailsRemoteDataSource _detailsRemoteDataSource;
  DetailsRepositoryImpl(this._detailsRemoteDataSource);

  @override
  Future<Either<Failure, DoctorEntity>> getDoctorById(String id) async {
    try {
      final response = await _detailsRemoteDataSource.getDoctorById(id);

      if (response == null) {
        return Left(Failure('Doctor not found'));
      }
      return Right(DoctorMapper.toEntity(response));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
