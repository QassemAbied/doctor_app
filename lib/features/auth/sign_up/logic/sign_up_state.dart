
import 'package:freezed_annotation/freezed_annotation.dart';
part  'sign_up_state.freezed.dart';

@Freezed()
 class SignUpState<T> with _$SignUpState<T>{
  factory SignUpState.initial() = _Initial;
  factory SignUpState.loading() = Loading;
  factory SignUpState.success(T data) = Success<T>;
  factory SignUpState.error({required String message}) = Error;

  // factory SignUpState.changeObscure() = ChangeObscure;
  // factory SignUpState.changeObscure2() = ChangeObscure2;
  // const factory SignUpState({
  //   required bool obscure1,
  //   required bool obscure2,
  // }) = _SignUpState;
}

@freezed
abstract class ToggleSignUpState with _$ToggleSignUpState {
  const factory ToggleSignUpState({
    required bool obscure1,
    required bool obscure2,
  }) = _ToggleSignUpState;
}


