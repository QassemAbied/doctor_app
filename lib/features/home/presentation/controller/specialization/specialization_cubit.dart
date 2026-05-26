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

  void filterByCategory(int? categoryId) {
    if (categoryId == null) {
      // emit(HomeState.success(searchAllDoctors));
    } else {
      // final filter = searchAllDoctors
      //     .where(
      //       (e) => e.name.toLowerCase().contains(query.toLowerCase()),
      //     )
      //     .toList();
      // emit(HomeState.success(filter));
      // emit(HomeState.success(searchAllDoctors));
    }
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
