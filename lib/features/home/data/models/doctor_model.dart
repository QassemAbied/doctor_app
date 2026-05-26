import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()

class DoctorModel {
  final String id;

  final String name;

  final String image;

  @JsonKey(name: 'specialization_id')
  final String specializationId;

  final double rating;


  @JsonKey(name: 'reviews_count')
  final int reviewsCount;

  @JsonKey(name: 'patients_count')
  final int patientsCount;

  @JsonKey(name: 'experience_years')
  final int experienceYears;

  final double price;

  final String phone;

  final String email;

  final String gender;

  final String about;

  final String location;

  final double latitude;

  final double longitude;
  final String specializationName;

  final String specializationImage;
  @JsonKey(name: 'open_time')
  final String openTime;

  @JsonKey(name: 'close_time')
  final String closeTime;

  @JsonKey(name: 'waiting_time')
  final int waitingTime;

  final String degree;

  final String university;

  final List<String> languages;

  @JsonKey(name: 'is_available')
  final bool isAvailable;

  DoctorModel({
    required this.id,
    required this.name,
    required this.image,
    required this.specializationId,
    required this.rating,
    required this.reviewsCount,
    required this.patientsCount,
    required this.experienceYears,
    required this.price,
    required this.phone,
    required this.email,
    required this.gender,
    required this.about,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.openTime,
    required this.closeTime,
    required this.waitingTime,
    required this.degree,
    required this.university,
    required this.languages,
    required this.isAvailable,
    required this.specializationName,

    required this.specializationImage,
  });

  factory DoctorModel.fromJson(
      Map<String, dynamic> json,
      ) {

    return DoctorModel(

      id: json['id'],

      name: json['name'],

      image: json['image'],

      specializationId:
      json['specialization_id'],

      specializationName:
      json['specializations']['name'],

      specializationImage:
      json['specializations']['image'],

      rating:
      (json['rating'] as num)
          .toDouble(),

      reviewsCount:
      json['reviews_count'],

      patientsCount:
      json['patients_count'],

      experienceYears:
      json['experience_years'],

      price:
      (json['price'] as num)
          .toDouble(),

      phone: json['phone'],

      email: json['email'],

      gender: json['gender'],

      about: json['about'],

      location: json['location'],

      latitude:
      (json['latitude'] as num)
          .toDouble(),

      longitude:
      (json['longitude'] as num)
          .toDouble(),

      openTime: json['open_time'],

      closeTime: json['close_time'],

      waitingTime:
      json['waiting_time'],

      degree: json['degree'],

      university:
      json['university'],

      languages:
      List<String>.from(
        json['languages'],
      ),

      isAvailable:
      json['is_available'],
    );
  }

  Map<String, dynamic> toJson() =>
      _$DoctorModelToJson(this);
}