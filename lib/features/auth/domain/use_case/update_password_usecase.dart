import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../repository.dart';

class UpdatePasswordUseCase {
  final AuthRepository _authRepository;

  UpdatePasswordUseCase(this._authRepository);

  Future<Either<Failure, void>> call(String password) async {
    return await _authRepository.updatePassword(password);
  }
}
