import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../repository.dart';

class SignOutUseCase {
  final AuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  Future<Either<Failure, void>> call() async {
    return await _authRepository.signOut();
  }
}
