import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/home/presentation/controller/recommendation/recommendation_state.dart';

import '../../../domain/entities/doctor_entity.dart';
import '../../../domain/entities/specialization_entity.dart';
import '../../../domain/use_case/doctor_usecase.dart';
import '../../../domain/use_case/get_specialization_usecase.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final GetDoctorsUseCase _getDoctorsUseCase;
  final GetSpecializationUseCase _getSpecializationUseCase;

  RecommendationCubit(this._getDoctorsUseCase, this._getSpecializationUseCase)
    : super(RecommendationInitial());
  List<DoctorEntity> allDoctors = [];
  List<DoctorEntity> filteredDoctors = [];
  List<DoctorEntity> searchDoctors = [];
  Future<void> searchDoctorsByName({required String query}) async {
    if (query.isEmpty) {
      emit(RecommendationSuccess(allDoctors));

      return;
    }

    searchDoctors = allDoctors
        .where(
          (doctor) => doctor.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    emit(SearchRecommendationSuccess(searchDoctors));
  }
  Future<void> filterDoctorsByCategory(String specializationId) async {
    if (specializationId == 'All') {
      filteredDoctors = allDoctors;
    } else {
      filteredDoctors = allDoctors
          .where((doctor) => doctor.specializationId == specializationId)
          .toList();
    }
    if (isClosed) return;
    emit(RecommendationSuccess(filteredDoctors));
  }

  Future<void> getDoctors() async {
    if (isClosed) return;
    emit(RecommendationLoading());

    final response = await _getDoctorsUseCase();

    response.fold((l) => emit(RecommendationError(l.message)), (r) {
      allDoctors = r;
      filteredDoctors = r;
      if (isClosed) return;
      emit(RecommendationSuccess(r));
    });
  }

  int selectIndex = 0;
  List<SpecializationEntity> categories = [];
  void changeIndex(int index) {
    selectIndex = index;
    emit(RecommendationSpecializationSuccess(categories));
  }

  Future<void> getSpecialization() async {
    emit(RecommendationSpecializationLoading());
    final response = await _getSpecializationUseCase();
    response.fold((l) => emit(RecommendationSpecializationError(l.message)), (
      data,
    ) {
      categories = data;
      emit(RecommendationSpecializationSuccess(categories));
    });
  }
}
