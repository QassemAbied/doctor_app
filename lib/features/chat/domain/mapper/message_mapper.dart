import '../../data/model/message_model.dart';
import '../entities/message_entity.dart';

extension MessageModelMapper on MessageModel {
  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      audio: audio,
      senderId: senderId,

      receiverId: receiverId,

      message: message,

      image: image,

      createdAt: createdAt,
    );
  }
}
