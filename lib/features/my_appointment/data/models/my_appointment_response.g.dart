// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAppointmentResponse _$MyAppointmentResponseFromJson(
  Map<String, dynamic> json,
) => MyAppointmentResponse(
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$MyAppointmentResponseToJson(
  MyAppointmentResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.data,
  'status': instance.status,
  'code': instance.code,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: (json['id'] as num?)?.toInt(),
  doctor: json['doctor'] == null
      ? null
      : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
  patient: json['patient'] == null
      ? null
      : Patient.fromJson(json['patient'] as Map<String, dynamic>),
  appointmentTime: json['appointment_time'] as String?,
  appointmentEndTime: json['appointment_end_time'] as String?,
  status: json['status'] as String?,
  notes: json['notes'] as String?,
  appointmentPrice: (json['appointmentPrice'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'doctor': instance.doctor,
  'patient': instance.patient,
  'appointment_time': instance.appointmentTime,
  'appointment_end_time': instance.appointmentEndTime,
  'status': instance.status,
  'notes': instance.notes,
  'appointmentPrice': instance.appointmentPrice,
};

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  gender: json['gender'] as String?,
  address: json['address'] as String?,
  description: json['description'] as String?,
  degree: json['degree'] as String?,
  specialization: json['specialization'] == null
      ? null
      : Specialization.fromJson(json['specialization'] as Map<String, dynamic>),
  city: json['city'] == null
      ? null
      : City.fromJson(json['city'] as Map<String, dynamic>),
  appointPrice: (json['appointPrice'] as num?)?.toInt(),
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
);

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'photo': instance.photo,
  'gender': instance.gender,
  'address': instance.address,
  'description': instance.description,
  'degree': instance.degree,
  'specialization': instance.specialization,
  'city': instance.city,
  'appointPrice': instance.appointPrice,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
};

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpecializationToJson(Specialization instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

City _$CityFromJson(Map<String, dynamic> json) => City(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  governrate: json['governrate'] == null
      ? null
      : Specialization.fromJson(json['governrate'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'governrate': instance.governrate,
};

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'gender': instance.gender,
};
