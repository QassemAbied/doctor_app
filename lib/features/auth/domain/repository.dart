import 'package:dartz/dartz.dart';

import '../../../core/error/error.dart';
import 'entities/sign_up_params.dart';
import 'entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUp(SignUpParams params);
  Future<Either<Failure, UserEntity>> signIn(SignInParams params);
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, void>> updatePassword(String password);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, UserEntity>> updateUser(UpdateUserParams updateUserParams);
}
