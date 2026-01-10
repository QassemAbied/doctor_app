
 import 'package:doctor_app/features/my_appointment/data/models/my_appointment_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_appointment_state.freezed.dart';


@Freezed()
class MyAppointmentState<T> with _$MyAppointmentState {
   const factory MyAppointmentState.initial()= _Initial;
   const factory MyAppointmentState.loading()= Loading;
   const factory MyAppointmentState.success(MyAppointmentResponse myAppointmentResponse)= Success<T>;
   const factory MyAppointmentState.error({required String error})= Error;
 }

