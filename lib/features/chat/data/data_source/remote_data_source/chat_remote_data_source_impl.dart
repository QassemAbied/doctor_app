import '../../../../../core/services/supa_base_service/supa_base_chat_service.dart';
import '../../model/chat_model.dart';
import '../../model/message_model.dart';
import 'chat_remote_data_source.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final SupABaseChatService _chatService;

  ChatRemoteDataSourceImpl(this._chatService);

  @override
  Future<void> sendMessage({
    required String receiverId,

    required String message,
  }) async {
    await _chatService.sendMessage(receiverId: receiverId, message: message);
  }

  @override
  Stream<List<MessageModel>> getMessages(String receiverId) {
    return _chatService.getMessages(receiverId);
  }

  @override
  Stream<List<ChatModel>> getAllChats() {
    return _chatService.getAllChats();
  }
}
