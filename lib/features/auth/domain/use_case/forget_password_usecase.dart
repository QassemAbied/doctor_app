import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository _authRepository;

  ForgotPasswordUseCase(this._authRepository);

  Future<Either<Failure, void>> call(String email) async {
    return await _authRepository.forgotPassword(email);
  }
}
