import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/local_notification_entities.dart';

part 'local_notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends NotificationEntity {
  @JsonKey(name: 'user_id')
  final String userIdModel;

  @JsonKey(name: 'is_read')
  final bool isReadModel;

  @JsonKey(name: 'created_at')
  final DateTime createdAtModel;

   NotificationModel({
    required super.id,

    required this.userIdModel,

    required super.title,

    required super.body,

    required this.isReadModel,

    required this.createdAtModel,
  }) : super(
         userId: userIdModel,

         isRead: isReadModel,

         createdAt: createdAtModel,
       );

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
