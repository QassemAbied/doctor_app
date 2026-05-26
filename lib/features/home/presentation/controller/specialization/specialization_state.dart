import '../../../domain/entities/specialization_entity.dart';

class SpecializationState {}

class HomeInitial extends SpecializationState {}

class SpecializationChange extends SpecializationState {
 final int index;
  SpecializationChange(this.index);
}

class SpecializationLoading extends SpecializationState {}
class SpecializationSuccess extends SpecializationState {
  final List<SpecializationEntity> specializations;

  SpecializationSuccess(this.specializations);
}
class SpecializationError extends SpecializationState {
  final String message;
  SpecializationError(this.message);
}
