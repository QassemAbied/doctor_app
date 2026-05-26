// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationModel _$SpecializationModelFromJson(Map<String, dynamic> json) =>
    SpecializationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$SpecializationModelToJson(
  SpecializationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'created_at': instance.createdAt,
};
