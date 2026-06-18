import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/services/location/location_service.dart';
import '../../../domain/entities/doctor_entity.dart';
import '../../../domain/entities/specialization_entity.dart';
import '../../../domain/use_case/doctor_usecase.dart';
import '../../../domain/use_case/get_specialization_usecase.dart';
import 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState>
    with WidgetsBindingObserver {
  final GetDoctorsUseCase _getDoctorsUseCase;
  final LocationService _locationService;
  final GetSpecializationUseCase _getSpecializationUseCase;

  RecommendationCubit(
    this._getDoctorsUseCase,
    this._getSpecializationUseCase,
    this._locationService,
  ) : super(RecommendationInitial()) {
    WidgetsBinding.instance.addObserver(this);
  }

  List<DoctorEntity> allDoctors = [];
  List<DoctorEntity> filteredDoctors = [];
  List<DoctorEntity> searchDoctors = [];

  int selectIndex = 0;

  List<SpecializationEntity> categories = [];

  double? userLat;
  double? userLng;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getUserLocation();
    }
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

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

    response.fold(
      (l) {
        emit(RecommendationError(l.message));
      },
      (r) {
        allDoctors = r;

        filteredDoctors = r;

        if (userLat != null && userLng != null) {
          sortNearestDoctors();
        }

        if (isClosed) return;

        emit(RecommendationSuccess(allDoctors));
      },
    );
  }

  void changeIndex(int index) {
    selectIndex = index;

    emit(RecommendationSpecializationSuccess(categories));
  }

  Future<void> getSpecialization() async {
    emit(RecommendationSpecializationLoading());

    final response = await _getSpecializationUseCase();

    response.fold(
      (l) {
        emit(RecommendationSpecializationError(l.message));
      },
      (data) {
        categories = data;

        emit(RecommendationSpecializationSuccess(categories));
      },
    );
  }

  Future<void> getUserLocation() async {
    try {

      final position = await _locationService.getCurrentUserLocation();

      userLat = position.latitude;
      userLng = position.longitude;

      if (allDoctors.isNotEmpty) {
        sortNearestDoctors();
      }

      emit(RecommendationSuccess(allDoctors));
    } catch (e) {
      emit(RecommendationError(e.toString()));
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
    if (userLat == null || userLng == null) {
      return;
    }

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
