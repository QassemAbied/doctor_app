

import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointments_response.g.dart';


@JsonSerializable()
class AppointmentsResponse {
final  String? message;
@JsonKey(name: 'data')
final DataDoctorAndPatient? dataDoctorAndPatient;
 final bool? status;
 final int? code;

  AppointmentsResponse({this.message, this.dataDoctorAndPatient, this.status, this.code});

 factory AppointmentsResponse.fromJson(Map<String, dynamic> json) =>
     _$AppointmentsResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$AppointmentsResponseToJson(this);
}
@JsonSerializable()
class DataDoctorAndPatient {
 final int? id;
 @JsonKey(name: 'doctor')
 final DoctorData? doctorData;
 final PatientData? patient;
 final String? appointmentTime;
 final String? appointmentEndTime;
  final String? status;
  final String? notes;
  final int? appointmentPrice;

  DataDoctorAndPatient(
      {this.id,
        this.doctorData,
        this.patient,
        this.appointmentTime,
        this.appointmentEndTime,
        this.status,
        this.notes,
        this.appointmentPrice});

 factory DataDoctorAndPatient.fromJson(Map<String, dynamic> json) =>
     _$DataDoctorAndPatientFromJson(json);

 Map<String, dynamic> toJson() =>_$DataDoctorAndPatientToJson(this);
}
@JsonSerializable()
class DoctorData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  Specialization? specialization;
  City? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  DoctorData(
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

  factory DoctorData.fromJson(Map<String, dynamic> json) =>
      _$DoctorDataFromJson(json);

  Map<String, dynamic> toJson() =>_$DoctorDataToJson(this);
}
@JsonSerializable()
class Specialization {
 final int? id;
 final String? name;

  Specialization({this.id, this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

  Map<String, dynamic> toJson() =>_$SpecializationToJson(this);
}
@JsonSerializable()
class City {
 final int? id;
 final String? name;
 final Specialization? governrate;

  City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);

  Map<String, dynamic> toJson() =>_$CityToJson(this);
}
@JsonSerializable()
class PatientData {
 final int? id;
 final String? name;
 final String? email;
 final String? phone;
 final String? gender;

  PatientData({this.id, this.name, this.email, this.phone, this.gender});
  factory PatientData.fromJson(Map<String, dynamic> json) =>
      _$PatientDataFromJson(json);

  Map<String, dynamic> toJson() =>_$PatientDataToJson(this);
}