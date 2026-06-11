import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String id;

  @JsonKey(name: 'sender_id')
  final String senderId;

  @JsonKey(name: 'receiver_id')
  final String receiverId;

  final String? message;

  final String? image;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const MessageModel({
    required this.id,

    required this.senderId,

    required this.receiverId,

    this.message,

    this.image,

    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}

