

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';
@Freezed()
 class LoginState<T> with _$LoginState<T>{
  const factory LoginState.initial()= _Initial;
  const factory LoginState.loading()= Loading;
  const factory LoginState.success(T data)= Success<T>;
  const factory LoginState.error({required String error})= Error;
}

@freezed
abstract class ToggleLoginState with _$ToggleLoginState {
  const factory ToggleLoginState({
    required bool obscure,
  }) = _ToggleLoginState;
}