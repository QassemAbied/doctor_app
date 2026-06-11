import '../../data/model/chat_model.dart';
import '../entities/chat_entity.dart';

extension ChatModelMapper on ChatModel {
  ChatEntity toEntity() {
    return ChatEntity(
      receiverId: receiverId,

      name: name,

      image: image,

      lastMessage: lastMessage,

      time: time,
    );
  }
}
