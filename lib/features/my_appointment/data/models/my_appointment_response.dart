


import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_appointment_response.g.dart';
@JsonSerializable()
class MyAppointmentResponse {
 final String? message;
 final List<Data>? data;
 final bool? status;
 final int? code;

  MyAppointmentResponse({this.message, this.data, this.status, this.code});

  factory MyAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$MyAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$MyAppointmentResponseToJson(this);
}
@JsonSerializable()
class Data {
final  int? id;
final  Doctor? doctor;
 final Patient? patient;
@JsonKey(name: 'appointment_time')
final String? appointmentTime;
@JsonKey(name: 'appointment_end_time')
 final String? appointmentEndTime;
 final String? status;
 final String? notes;
  final int? appointmentPrice;

  Data(
      {this.id,
        this.doctor,
        this.patient,
        this.appointmentTime,
        this.appointmentEndTime,
        this.status,
        this.notes,
        this.appointmentPrice});

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() =>_$DataToJson(this);
}
@JsonSerializable()
class Doctor {
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

  Doctor(
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

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);

  Map<String, dynamic> toJson() =>_$DoctorToJson(this);
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
class Patient {
 final int? id;
 final String? name;
 final String? email;
 final String? phone;
 final String? gender;

  Patient({this.id, this.name, this.email, this.phone, this.gender});

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() =>_$PatientToJson(this);
}