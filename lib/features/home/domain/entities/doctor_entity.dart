class DoctorEntity {
  final String id;

  final String name;

  final String image;

  final String specializationId;

  final double rating;

  final int reviewsCount;
  final String specializationName;

  final String specializationImage;

  final int patientsCount;

  final int experienceYears;

  final double price;

  final String phone;

  final String email;

  final String gender;

  final String about;

  final String location;

  final double latitude;

  final double longitude;

  final String openTime;

  final String closeTime;

  final int waitingTime;

  final String degree;

  final String university;

  final List<String> languages;

  final bool isAvailable;

  DoctorEntity({
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
  factory DoctorEntity.fake() {
    return DoctorEntity(
      id: '',

      name: 'Dr Ahmed',

      image: 'https://via.placeholder.com/150',

      specializationId: '',

      specializationName: 'Cardiology',

      specializationImage: '',

      rating: 4.8,

      reviewsCount: 120,

      patientsCount: 2000,

      experienceYears: 10,

      price: 250,

      phone: '',

      email: '',

      gender: '',

      about: '',

      location: 'Beni Suef',

      latitude: 0,

      longitude: 0,

      openTime: '',

      closeTime: '',

      waitingTime: 15,

      degree: '',

      university: '',

      languages: [],

      isAvailable: true,
    );
  }
}
