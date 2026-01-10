
 import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/details_doctors_models.dart';
part 'details_doctors_state.freezed.dart';

@Freezed()
class DetailsDoctorsState<T> with _$DetailsDoctorsState<T> {

   const factory  DetailsDoctorsState.initials() = _initials;
   const factory  DetailsDoctorsState.success(DataForDoctors? dataForDoctors ) = Success;
   const factory  DetailsDoctorsState.loading() = Loading;
   const factory  DetailsDoctorsState.error({required String messages}) = Error;
 }

