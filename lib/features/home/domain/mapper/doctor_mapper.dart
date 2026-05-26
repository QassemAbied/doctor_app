import '../../data/models/doctor_model.dart';
import '../entities/doctor_entity.dart';

class DoctorMapper {

  static DoctorEntity toEntity(
      DoctorModel model,
      ) {
    return DoctorEntity(
      id: model.id,
      name: model.name,
      image: model.image,
      specializationId: model.specializationId,
      rating: model.rating,
      reviewsCount: model.reviewsCount,
      patientsCount: model.patientsCount,
      experienceYears: model.experienceYears,
      price: model.price,
      phone: model.phone,
      email: model.email,
      gender: model.gender,
      about: model.about,
      location: model.location,
      latitude: model.latitude,
      longitude: model.longitude,
      openTime: model.openTime,
      closeTime: model.closeTime,
      waitingTime: model.waitingTime,
      degree: model.degree,
      university: model.university,
      languages: model.languages,
      isAvailable: model.isAvailable,
      specializationName: model.specializationName,
      specializationImage: model.specializationImage,
    );
  }

  static List<DoctorEntity> toEntityList(
      List<DoctorModel> models,
      ) {
    return models
        .map((e) => toEntity(e))
        .toList();
  }
}