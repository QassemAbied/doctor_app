import 'package:freezed_annotation/freezed_annotation.dart';
part 'appointment_request.g.dart';


@JsonSerializable()
class AppointmentRequest {
  @JsonKey(name: 'doctor_id')
  final int? doctorId;
  @JsonKey(name: 'start_time')
  final String startTime;

  AppointmentRequest(this.doctorId, this.startTime);

  factory AppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$AppointmentRequestFromJson(json);

  Map<String, dynamic> toJson() =>_$AppointmentRequestToJson(this);
}