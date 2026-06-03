// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: json['id'] as String,
      doctorId: json['doctorId'] as String,
      userId: json['userId'] as String,
      appointmentDate: json['appointmentDate'] as String,
      appointmentTime: json['appointmentTime'] as String,
      appointmentType: json['appointmentType'] as String,
      paymentMethod: json['paymentMethod'] as String,
      price: (json['price'] as num).toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'userId': instance.userId,
      'appointmentDate': instance.appointmentDate,
      'appointmentTime': instance.appointmentTime,
      'appointmentType': instance.appointmentType,
      'paymentMethod': instance.paymentMethod,
      'price': instance.price,
      'status': instance.status,
    };
