// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModels _$HomeModelsFromJson(Map<String, dynamic> json) => HomeModels(
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : DataHomeModels.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$HomeModelsToJson(HomeModels instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data?.map((e) => e?.toJson()).toList(),
      'status': instance.status,
      'code': instance.code,
    };

DataHomeModels _$DataHomeModelsFromJson(Map<String, dynamic> json) =>
    DataHomeModels(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : DoctorsDataModels.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$DataHomeModelsToJson(DataHomeModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctors?.map((e) => e?.toJson()).toList(),
    };

DoctorsDataModels _$DoctorsDataModelsFromJson(Map<String, dynamic> json) =>
    DoctorsDataModels(
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
          : Specialization.fromJson(
              json['specialization'] as Map<String, dynamic>,
            ),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      appointPrice: (json['appointPrice'] as num?)?.toInt(),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$DoctorsDataModelsToJson(DoctorsDataModels instance) =>
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
      'specialization': instance.specialization?.toJson(),
      'city': instance.city?.toJson(),
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
  'governrate': instance.governrate?.toJson(),
};
