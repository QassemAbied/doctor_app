import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/auth/domain/mapper/user_mapper.dart';
import 'package:doctor_app/features/auth/domain/repository.dart';
import '../../../core/error/auth_error_handler.dart';
import '../../../core/error/error.dart';
import '../domain/entities/sign_up_params.dart';
import '../domain/entities/user_entity.dart';
import 'data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepositoryImpl(this._authRemoteDataSource);
  @override
  Future<Either<Failure, UserEntity>> signUp(SignUpParams params) async {
    try {
      final res = await _authRemoteDataSource.signUp(params);
      return Right(res);
    } catch (e) {
      return Left(AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(SignInParams params) async {
    try {
      final res = await _authRemoteDataSource.signIn(params);
      return Right(res);
    } catch (e) {
      return Left(AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await _authRemoteDataSource.forgotPassword(email);
      return const Right(null);
    } catch (e) {
      return Left(AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(String password) async {
    try {
      await _authRemoteDataSource.updatePassword(password);

      return const Right(null);
    } catch (e) {
      return Left(AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authRemoteDataSource.signOut();
      return Right(null);
    } catch (e) {
      return Left(AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async{
    try {
      final res = await _authRemoteDataSource.getUser();
      
      return Right(UserMapper.toEntity(res));
    } catch (e) {
      return Left(AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(UpdateUserParams updateUserParams)async {
    try {
      final res = await _authRemoteDataSource.updateUser(updateUserParams);
      return Right(UserMapper.toEntity(res));
    } catch (e) {
      return Left(AuthErrorHandler.handle(e));
    }
  }
}
