
import 'package:doctor_app/features/home/data/models/home_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
   const factory HomeState.initial()= _Initial;
  const factory HomeState.loading() = Loading;
   const factory HomeState.success(List<DoctorsDataModels> doctors) = Success;
  //const factory HomeState.success(List<DataHomeModels?>? dataHomeModels) = Success;
  const factory HomeState.error({required String error}) = Error;



   // const factory HomeState.doctorSuccess( List<DoctorsDataModels?>? doctors) = DoctorSuccess;
   // const factory HomeState.doctorError({required ErrorHandler error}) = DoctorError;


}
