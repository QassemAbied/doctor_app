// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String,
      userIdModel: json['user_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      isReadModel: json['is_read'] as bool,
      createdAtModel: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'user_id': instance.userIdModel,
      'is_read': instance.isReadModel,
      'created_at': instance.createdAtModel.toIso8601String(),
    };
