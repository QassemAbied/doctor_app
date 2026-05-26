import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/error/error.dart';
import 'package:doctor_app/features/home/domain/entities/doctor_entity.dart';
import 'package:doctor_app/features/home/domain/entities/specialization_entity.dart';
import 'package:doctor_app/features/home/domain/repository.dart';

import '../domain/mapper/doctor_mapper.dart';
import '../domain/mapper/specilalization_mapper.dart';
import 'data_source/remote_data_Source/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);
  @override
  Future<Either<Failure, List<SpecializationEntity>>>
  getSpecialization() async {
    try {
      final response = await _homeRemoteDataSource.getSpecialization();
      final specializations = SpecializationMapper.toEntityList(response);
      return Right(specializations);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors()async {
    try {
      final response = await _homeRemoteDataSource.getDoctors();
      final doctors = DoctorMapper.toEntityList(response);
      return Right(doctors);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
