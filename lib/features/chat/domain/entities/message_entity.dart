class MessageEntity {
  final String id;

  final String senderId;

  final String receiverId;

  final String? message;

  final String? image;
  final String? audio;

  final DateTime createdAt;

  const MessageEntity({
    required this.id,

    required this.senderId,

    required this.receiverId,

    this.message,
    this.audio,

    this.image,

    required this.createdAt,
  });
}
