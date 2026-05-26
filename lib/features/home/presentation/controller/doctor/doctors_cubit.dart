import 'package:bloc/bloc.dart';

import '../../../domain/entities/doctor_entity.dart';
import '../../../domain/use_case/doctor_usecase.dart';
import 'doctors_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final GetDoctorsUseCase _getDoctorsUseCase;

  DoctorCubit(this._getDoctorsUseCase) : super(DoctorInitial());

  List<DoctorEntity> allDoctors = [];

  List<DoctorEntity> filteredDoctors = [];
  Future<void> getDoctors() async {
    if (isClosed) return;
    emit(DoctorLoading());

    final response = await _getDoctorsUseCase();

    response.fold((l) => emit(DoctorError(l.message)), (r) {
      allDoctors = r;
      filteredDoctors = r;
      if (isClosed) return;
      emit(DoctorSuccess(r));
    });
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
    emit(DoctorSuccess(filteredDoctors));
  }
}
