import '../../data/models/specialization_model.dart';
import '../../domain/entities/specialization_entity.dart';

class SpecializationMapper {
  static SpecializationEntity toEntity(SpecializationModel model) {
    return SpecializationEntity(
      id: model.id,

      name: model.name,

      image: model.image,

      createdAt: model.createdAt,
    );
  }

  static List<SpecializationEntity> toEntityList(
    List<SpecializationModel> models,
  ) {
    return models.map((model) => toEntity(model)).toList();
  }

  static SpecializationModel toModel(SpecializationEntity entity) {
    return SpecializationModel(
      id: entity.id,

      name: entity.name,

      image: entity.image,

      createdAt: entity.createdAt,
    );
  }
}
