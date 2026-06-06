import 'package:doctor_app/features/home/data/models/doctor_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/eunm.dart';

part 'appointment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppointmentModel {

  final String id;

  @JsonKey(name: 'doctor_id')
  final String doctorId;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'appointment_date')
  final String appointmentDate;

  @JsonKey(name: 'appointment_time')
  final String appointmentTime;

  @JsonKey(name: 'appointment_type')
  final String appointmentType;

  @JsonKey(name: 'payment_method')
  final String paymentMethod;

  final double price;
  @JsonKey(
    unknownEnumValue:
    Status.upcoming,
  )
  final Status status;

  @JsonKey(name: 'doctors')
  final DoctorModel doctor;

  const AppointmentModel({

    required this.id,

    required this.doctorId,

    required this.userId,

    required this.appointmentDate,

    required this.appointmentTime,

    required this.appointmentType,

    required this.paymentMethod,

    required this.price,

    required this.status,

    required this.doctor,
  });

  factory AppointmentModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AppointmentModelToJson(this);
}