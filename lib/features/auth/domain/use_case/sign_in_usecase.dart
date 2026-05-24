import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/error/error.dart';
import 'package:doctor_app/features/auth/domain/entities/sign_up_params.dart';
import 'package:doctor_app/features/auth/domain/repository.dart';
import '../entities/user_entity.dart';

class SignInUseCase {
  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);
  Future<Either<Failure, UserEntity>> call(SignInParams params)async {
    return await _authRepository.signIn(params);
  }
}
