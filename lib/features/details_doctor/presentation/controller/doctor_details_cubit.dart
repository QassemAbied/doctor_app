import 'package:bloc/bloc.dart';

import '../../domain/use_case/get_doctor_by_id_usecase.dart';
import 'doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  final GetDoctorByIdUseCase _getDoctorByIdUseCase;

  DoctorDetailsCubit(this._getDoctorByIdUseCase)
    : super(DoctorDetailsInitial());

  Future<void> getDoctorById(String id) async {
    print( id);
    if (isClosed) return;
    emit(DoctorDetailsLoading());

    final response = await _getDoctorByIdUseCase(id);


    if (isClosed) return;
    response.fold(
      (l) => emit(DoctorDetailsError(l.message)),

      (r) => emit(DoctorDetailsSuccess(r)),
    );
  }
}
