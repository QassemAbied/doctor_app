import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';

import '../../../../core/error/error.dart';
import '../repository.dart';

class GetUserUesCase {
  final AuthRepository _authRepository;

  GetUserUesCase(this._authRepository);

  Future<Either<Failure, UserEntity>> call() async {
    return await _authRepository.getUser();
  }
}