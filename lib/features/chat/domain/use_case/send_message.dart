import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String receiverId,

    required String message,
  }) async {
    return await repository.sendMessage(
      receiverId: receiverId,

      message: message,
    );
  }
}
