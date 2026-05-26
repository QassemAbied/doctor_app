class SpecializationEntity {
  final String id;

  final String name;

  final String image;

  final String? createdAt;

  const SpecializationEntity({
    required this.id,
    required this.name,
    required this.image,
    this.createdAt,
  });

  factory SpecializationEntity.fake() {

    return SpecializationEntity(

      id: '1',

      name: 'Cardiology',

      image:
      'https://via.placeholder.com/150',
    );
  }


}
