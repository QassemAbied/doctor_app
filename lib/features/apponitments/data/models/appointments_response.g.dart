// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentsResponse _$AppointmentsResponseFromJson(
  Map<String, dynamic> json,
) => AppointmentsResponse(
  message: json['message'] as String?,
  dataDoctorAndPatient: json['data'] == null
      ? null
      : DataDoctorAndPatient.fromJson(json['data'] as Map<String, dynamic>),
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$AppointmentsResponseToJson(
  AppointmentsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.dataDoctorAndPatient,
  'status': instance.status,
  'code': instance.code,
};

DataDoctorAndPatient _$DataDoctorAndPatientFromJson(
  Map<String, dynamic> json,
) => DataDoctorAndPatient(
  id: (json['id'] as num?)?.toInt(),
  doctorData: json['doctor'] == null
      ? null
      : DoctorData.fromJson(json['doctor'] as Map<String, dynamic>),
  patient: json['patient'] == null
      ? null
      : PatientData.fromJson(json['patient'] as Map<String, dynamic>),
  appointmentTime: json['appointmentTime'] as String?,
  appointmentEndTime: json['appointmentEndTime'] as String?,
  status: json['status'] as String?,
  notes: json['notes'] as String?,
  appointmentPrice: (json['appointmentPrice'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataDoctorAndPatientToJson(
  DataDoctorAndPatient instance,
) => <String, dynamic>{
  'id': instance.id,
  'doctor': instance.doctorData,
  'patient': instance.patient,
  'appointmentTime': instance.appointmentTime,
  'appointmentEndTime': instance.appointmentEndTime,
  'status': instance.status,
  'notes': instance.notes,
  'appointmentPrice': instance.appointmentPrice,
};

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
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

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
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

PatientData _$PatientDataFromJson(Map<String, dynamic> json) => PatientData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$PatientDataToJson(PatientData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
    };
