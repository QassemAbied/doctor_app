// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentRequest _$AppointmentRequestFromJson(Map<String, dynamic> json) =>
    AppointmentRequest(
      (json['doctor_id'] as num?)?.toInt(),
      json['start_time'] as String,
    );

Map<String, dynamic> _$AppointmentRequestToJson(AppointmentRequest instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'start_time': instance.startTime,
    };
