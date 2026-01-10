
import 'package:freezed_annotation/freezed_annotation.dart';
part 'appointment_store_state.freezed.dart';
@Freezed()
class AppointmentStoreState<T> with _$AppointmentStoreState<T>{
  const factory AppointmentStoreState.initial()= _Initial;
  const factory AppointmentStoreState.loading()= Loading;
  const factory AppointmentStoreState.success(T data)= Success<T>;
  const factory AppointmentStoreState.error({required String error})= Error;
}

