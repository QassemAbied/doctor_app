// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: json['id'] as String,
      doctorId: json['doctor_id'] as String,
      userId: json['user_id'] as String,
      appointmentDate: json['appointment_date'] as String,
      appointmentTime: json['appointment_time'] as String,
      appointmentType: json['appointment_type'] as String,
      paymentMethod: json['payment_method'] as String,
      price: (json['price'] as num).toDouble(),
      status: $enumDecode(
        _$StatusEnumMap,
        json['status'],
        unknownValue: Status.upcoming,
      ),
      doctor: DoctorModel.fromJson(json['doctors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctorId,
      'user_id': instance.userId,
      'appointment_date': instance.appointmentDate,
      'appointment_time': instance.appointmentTime,
      'appointment_type': instance.appointmentType,
      'payment_method': instance.paymentMethod,
      'price': instance.price,
      'status': _$StatusEnumMap[instance.status]!,
      'doctors': instance.doctor.toJson(),
    };

const _$StatusEnumMap = {
  Status.upcoming: 'upcoming',
  Status.completed: 'completed',
  Status.cancelled: 'cancelled',
};
