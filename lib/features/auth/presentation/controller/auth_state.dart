
import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';

class AuthState {}
final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}
final class SignUpSuccess extends AuthState {}
final class SignUpFailure extends AuthState {
  final String message;

  SignUpFailure(this.message);
}

final class SignInLoading extends AuthState {}
final class SignInSuccess extends AuthState {}
final class SignInFailure extends AuthState {
  final String message;

  SignInFailure(this.message);
}


final class ForgotPasswordLoading extends AuthState {}
final class ForgotPasswordSuccess extends AuthState {}
final class ForgotPasswordFailure extends AuthState {
  final String message;

  ForgotPasswordFailure(this.message);
}

final class UpdatePasswordLoading extends AuthState {}
final class UpdatePasswordSuccess extends AuthState {}
final class UpdatePasswordFailure extends AuthState {
  final String message;

  UpdatePasswordFailure(this.message);
}

final class ChangePasswordSignUp extends AuthState {}
final class ChangePasswordSignIn extends AuthState {}
final class ChangePasswordCondition extends AuthState {}


final class SignOutLoading extends AuthState {}
final class SignOutSuccess extends AuthState {}
final class SignOutFailure extends AuthState {
  final String message;
  SignOutFailure(this.message);
}


final class GetUserDataLoading extends AuthState {}
final class GetUserDataSuccess extends AuthState {
  final UserEntity userEntity;
  GetUserDataSuccess(this.userEntity);
}
final class GetUserDataFailure extends AuthState {
  final String message;
  GetUserDataFailure(this.message);
}

final class UpdateUserDataLoading extends AuthState {}
final class UpdateUserDataSuccess extends AuthState {
  final UserEntity userEntity;
  UpdateUserDataSuccess(this.userEntity);
}
final class UpdateUserDataFailure extends AuthState {
  final String message;
  UpdateUserDataFailure(this.message);
}


