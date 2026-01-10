
import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_doctors_models.g.dart';


@JsonSerializable()
class DetailsDoctorsModels {
 final String? message;
 @JsonKey(name: 'data')
 final DataForDoctors? dataForDoctors;
 final bool? status;
 final int? code;

  DetailsDoctorsModels({this.message, this.dataForDoctors, this.status, this.code});

factory DetailsDoctorsModels.fromJson(Map<String, dynamic> json) =>
    _$DetailsDoctorsModelsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsDoctorsModelsToJson(this);
}
@JsonSerializable()
class DataForDoctors {
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
 @JsonKey(name: 'start_time')
 final String? startTime;
 @JsonKey(name: 'end_time')
 final String? endTime;

 DataForDoctors(
      {this.id,
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
        this.endTime});

 factory DataForDoctors.fromJson(Map<String, dynamic> json) =>
     _$DataForDoctorsFromJson(json);

 Map<String, dynamic> toJson() => _$DataForDoctorsToJson(this);
}
@JsonSerializable()
class Specialization {
 final int? id;
 final String? name;

  Specialization({this.id, this.name});

 factory Specialization.fromJson(Map<String, dynamic> json) =>
     _$SpecializationFromJson(json);

 Map<String, dynamic> toJson() => _$SpecializationToJson(this);
}
@JsonSerializable()
class City {
 final int? id;
 final String? name;
 final Specialization? governrate;

  City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}