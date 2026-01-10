import 'package:json_annotation/json_annotation.dart';
part 'home_models.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeModels {
  final String? message;
  final List<DataHomeModels?>? data;
  final bool? status;
  final int? code;

  HomeModels({this.message, this.data, this.status, this.code});

  factory HomeModels.fromJson(Map<String, dynamic> json) =>
      _$HomeModelsFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataHomeModels {
  final int? id;
  final String? name;
  final List<DoctorsDataModels?>? doctors;

  DataHomeModels({this.id, this.name, this.doctors});

  factory DataHomeModels.fromJson(Map<String, dynamic> json) =>
      _$DataHomeModelsFromJson(json);

  Map<String, dynamic> toJson() => _$DataHomeModelsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DoctorsDataModels {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  final String? address;
  final String? description;
  final String? degree;
  final Specialization? specialization;
  final City? city;
  final int? appointPrice;
  final String? startTime;
  final String? endTime;

  DoctorsDataModels({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory DoctorsDataModels.fromJson(Map<String, dynamic> json) =>
      _$DoctorsDataModelsFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorsDataModelsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Specialization {
  final int? id;
  final String? name;

  Specialization({this.id, this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class City {
  final int? id;
  final String? name;
  final Specialization? governrate;

  City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
