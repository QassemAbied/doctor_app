import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/home/domain/entities/specialization_entity.dart';
import '../../../domain/use_case/get_specialization_usecase.dart';
import 'specialization_state.dart';

class SpecializationCubit extends Cubit<SpecializationState> {
  final GetSpecializationUseCase _getSpecializationUseCase;
  SpecializationCubit(this._getSpecializationUseCase) : super(HomeInitial());


  int selectIndex = 0;
  List<SpecializationEntity> categories = [];
  void changeIndex(int index) {
    selectIndex = index;
    emit(SpecializationSuccess(categories));
  }
  Future<void> getSpecialization() async {
    emit(SpecializationLoading());
    final response = await _getSpecializationUseCase();
    response.fold(
      (l) => emit(SpecializationError(l.message)),
      (data) {
        categories = data;
        emit(SpecializationSuccess(categories));
      },
    );
  }
}
