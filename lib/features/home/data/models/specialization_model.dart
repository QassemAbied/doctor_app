import 'package:json_annotation/json_annotation.dart';

part 'specialization_model.g.dart';

@JsonSerializable()
class SpecializationModel {
  final String id;

  final String name;

  final String image;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  SpecializationModel({
    required this.id,
    required this.name,
    required this.image,
    this.createdAt,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationModelToJson(this);
}
