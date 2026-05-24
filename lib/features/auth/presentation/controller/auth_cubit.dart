import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/services/shared_pref/shared_pref_helpers.dart';
import 'package:doctor_app/core/services/shared_pref/shared_pref_keys.dart';
import 'package:doctor_app/features/auth/domain/use_case/get_user_uescase.dart';
import 'package:doctor_app/features/auth/domain/use_case/sign_out_usecase.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../domain/entities/sign_up_params.dart';
import '../../domain/use_case/forget_password_usecase.dart';
import '../../domain/use_case/sign_in_usecase.dart';
import '../../domain/use_case/sign_up_usecase.dart';
import '../../domain/use_case/update_password_usecase.dart';
import '../../domain/use_case/update_user_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetUserUesCase _getUserUesCase;
  final UpdateUserUseCase _updateUserUseCase;

  AuthCubit(
    this._signUpUseCase,
    this._signInUseCase,
    this._forgotPasswordUseCase,
    this._updatePasswordUseCase,
    this._signOutUseCase,
      this._getUserUesCase,
      this._updateUserUseCase,
  ) : super(AuthInitial());

  bool passwordSigUp = true;
  bool passwordSignIn = true;

  void changePasswordSignUp(bool password) {
    passwordSigUp = !password;
    emit(ChangePasswordSignUp());
  }

  void changePasswordSignIn(bool password) {
    passwordSignIn = !password;
    emit(ChangePasswordSignIn());
  }

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  void changePasswordCondition(TextEditingController passwordController) {
    hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
    hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
    hasSpecialCharacters = AppRegex.hasSpecialCharacter(
      passwordController.text,
    );
    hasNumber = AppRegex.hasNumber(passwordController.text);
    hasMinLength = AppRegex.hasMinLength(passwordController.text);
    emit(ChangePasswordCondition());
  }

  Future<void> signUp(SignUpParams params) async {
    emit(SignUpLoading());
    final res = await _signUpUseCase(params);
    res.fold(
      (l) => emit(SignUpFailure(l.message)),
      (r) => emit(SignUpSuccess()),
    );
  }

  Future<void> signIn(SignInParams params) async {
    emit(SignInLoading());
    final res = await _signInUseCase(params);
    res.fold(
      (l) => emit(SignInFailure(l.message)),
      (r) => emit(SignInSuccess()),
    );
  }

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoading());

    final result = await _forgotPasswordUseCase(email);

    result.fold(
      (failure) {
        emit(ForgotPasswordFailure(failure.message));
      },

      (_) {
        emit(ForgotPasswordSuccess());
      },
    );
  }

  Future<void> updatePassword(String password) async {
    emit(UpdatePasswordLoading());

    final result = await _updatePasswordUseCase(password);

    result.fold(
      (failure) {
        emit(UpdatePasswordFailure(failure.message));
      },

      (_) {
        emit(UpdatePasswordSuccess());
      },
    );
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    final res = await _signOutUseCase();
   await SharedPrefHelper.removeData(SharedPrefKeys.userId);
    res.fold(
      (l) => emit(SignOutFailure(l.message)),
      (r) => emit(SignOutSuccess()),
    );
  }
  Future<void> getUser() async {
    emit(GetUserDataLoading());
    final res = await _getUserUesCase();
    res.fold(
      (l) => emit(GetUserDataFailure(l.message)),
      (r) => emit(GetUserDataSuccess(r)),
    );
  }
  Future<void> updateUser(UpdateUserParams updateUserParams) async {
    emit(UpdateUserDataLoading());
    final res = await _updateUserUseCase(updateUserParams);
    res.fold(
      (l) => emit(UpdateUserDataFailure(l.message)),
      (r) => emit(UpdateUserDataSuccess(r)));
  }
}
