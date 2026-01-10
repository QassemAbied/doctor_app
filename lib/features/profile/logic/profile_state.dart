import 'package:doctor_app/features/profile/data/models/profile_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';
@Freezed()
class ProfileState<T> with _$ProfileState {
  const factory ProfileState.initial()= _Initial;
  const factory ProfileState.loading()= Loading;
  const factory ProfileState.success(ProfileResponse profileResponse)= Success<T>;
  const factory ProfileState.error({required String error})= Error;
}
