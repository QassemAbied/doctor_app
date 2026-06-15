import 'package:dartz/dartz.dart';

import '../../../core/error/error.dart';
import 'entities/chat_entity.dart';
import 'entities/message_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, void>> sendMessage({
    required String receiverId,
    String? audioUrl,
    String? message,
    String? imageUrl,
  });

  Stream<List<MessageEntity>> getMessages(String receiverId);
  Stream<List<ChatEntity>> getAllChats();
}
