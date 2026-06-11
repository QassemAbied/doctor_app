import '../../model/chat_model.dart';
import '../../model/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<void> sendMessage({
    required String receiverId,
    required String message,
  });
  Stream<List<MessageModel>> getMessages(String receiverId);
  Stream<List<ChatModel>> getAllChats();
}
