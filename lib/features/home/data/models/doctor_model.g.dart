// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
  id: json['id'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  specializationId: json['specialization_id'] as String,
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviews_count'] as num).toInt(),
  patientsCount: (json['patients_count'] as num).toInt(),
  experienceYears: (json['experience_years'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  phone: json['phone'] as String,
  email: json['email'] as String,
  gender: json['gender'] as String,
  about: json['about'] as String,
  location: json['location'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  openTime: json['open_time'] as String,
  closeTime: json['close_time'] as String,
  waitingTime: (json['waiting_time'] as num).toInt(),
  degree: json['degree'] as String,
  university: json['university'] as String,
  languages: (json['languages'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  isAvailable: json['is_available'] as bool,
  specializationName: json['specializationName'] as String,
  specializationImage: json['specializationImage'] as String,
);

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'specialization_id': instance.specializationId,
      'rating': instance.rating,
      'reviews_count': instance.reviewsCount,
      'patients_count': instance.patientsCount,
      'experience_years': instance.experienceYears,
      'price': instance.price,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'about': instance.about,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'specializationName': instance.specializationName,
      'specializationImage': instance.specializationImage,
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
      'waiting_time': instance.waitingTime,
      'degree': instance.degree,
      'university': instance.university,
      'languages': instance.languages,
      'is_available': instance.isAvailable,
    };
