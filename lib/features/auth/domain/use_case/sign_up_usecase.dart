import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/error/error.dart';
import 'package:doctor_app/features/auth/domain/entities/sign_up_params.dart';
import 'package:doctor_app/features/auth/domain/repository.dart';
import '../entities/user_entity.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);
  Future<Either<Failure, UserEntity>> call(SignUpParams params)async {
    return await _authRepository.signUp(params);
  }
}
