import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String receiverId,
    String? audioUrl,
    String? message,
    String? imageUrl,
  }) async {
    return await repository.sendMessage(
      receiverId: receiverId,
      audioUrl: audioUrl,
      message: message,
      imageUrl: imageUrl,
    );
  }
}
