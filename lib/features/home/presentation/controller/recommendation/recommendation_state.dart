import '../../../domain/entities/doctor_entity.dart';
import '../../../domain/entities/specialization_entity.dart';

abstract class RecommendationState {}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoading extends RecommendationState {}

class RecommendationSuccess extends RecommendationState {
  final List<DoctorEntity> doctors;

  RecommendationSuccess(this.doctors);
}

class RecommendationError extends RecommendationState {
  final String message;

  RecommendationError(this.message);
}

class SearchRecommendationSuccess extends RecommendationState {
  final List<DoctorEntity> searchDoctors;

  SearchRecommendationSuccess(this.searchDoctors);
}



class RecommendationSpecializationChange extends RecommendationState {
  final int index;
  RecommendationSpecializationChange(this.index);
}

class RecommendationSpecializationLoading extends RecommendationState {}
class RecommendationSpecializationSuccess extends RecommendationState {
  final List<SpecializationEntity> specializations;

  RecommendationSpecializationSuccess(this.specializations);
}
class RecommendationSpecializationError extends RecommendationState {
  final String message;
  RecommendationSpecializationError(this.message);
}





