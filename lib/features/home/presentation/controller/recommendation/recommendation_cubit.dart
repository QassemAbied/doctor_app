import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/home/presentation/controller/recommendation/recommendation_state.dart';

import '../../../../../core/services/location/location_service.dart';
import '../../../domain/entities/doctor_entity.dart';
import '../../../domain/entities/specialization_entity.dart';
import '../../../domain/use_case/doctor_usecase.dart';
import '../../../domain/use_case/get_specialization_usecase.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final GetDoctorsUseCase _getDoctorsUseCase;
  final LocationService _locationService;

  final GetSpecializationUseCase _getSpecializationUseCase;

  RecommendationCubit(
    this._getDoctorsUseCase,
    this._getSpecializationUseCase,
    this._locationService,
  ) : super(RecommendationInitial());
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
      if (userLat != null && userLng != null) {
        sortNearestDoctors();
      }

      if (isClosed) return;
      emit(RecommendationSuccess(allDoctors));
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

  double? userLat;
  double? userLng;

  Future<void> getUserLocation() async {
    try {
      final position = await _locationService.getCurrentUserLocation();

      userLat = 29.072843057462567;

      userLng = 31.1378399269375;
      sortNearestDoctors();
      emit(RecommendationSuccess(allDoctors));
      print(userLat);

      print(userLng);
    } catch (e) {
      print(e.toString());
    }
  }

  double calculateDistance(DoctorEntity doctor) {
    return _locationService.calculateDistance(
      userLat!,
      userLng!,
      doctor.latitude,
      doctor.longitude,
    );
  }

  void sortNearestDoctors() {
    allDoctors.sort((a, b) {
      final distanceA = calculateDistance(a);

      final distanceB = calculateDistance(b);

      return distanceA.compareTo(distanceB);
    });

    emit(SearchRecommendationSuccess(allDoctors));
  }

  List<DoctorEntity> getNearbyDoctors() {
    if (userLat == null || userLng == null) {
      return [];
    }

    final nearbyDoctors = allDoctors.where((doctor) {
      final distance = calculateDistance(doctor);

      return distance <= 3500;
    }).toList();

    nearbyDoctors.sort((a, b) {
      final distanceA = calculateDistance(a);

      final distanceB = calculateDistance(b);

      return distanceA.compareTo(distanceB);
    });

    return nearbyDoctors.take(4).toList();
  }
}
