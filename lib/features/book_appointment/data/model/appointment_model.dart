import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/appointment_entity.dart';

part 'appointment_model.g.dart';

@JsonSerializable()

class AppointmentModel
    extends AppointmentEntity {

  const AppointmentModel({

    required super.id,

    required super.doctorId,

    required super.userId,

    required super.appointmentDate,

    required super.appointmentTime,

    required super.appointmentType,

    required super.paymentMethod,

    required super.price,

    required super.status,
  });

  factory AppointmentModel.fromJson(
      Map<String, dynamic> json,
      ) => _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AppointmentModelToJson(this);
}