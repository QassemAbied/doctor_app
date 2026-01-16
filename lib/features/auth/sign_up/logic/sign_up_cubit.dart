import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:doctor_app/features/auth/sign_up/data/repos/sign_up_repos.dart';
import 'package:doctor_app/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepos signUpRepos;
  SignUpCubit(this.signUpRepos) : super(
      SignUpState.initial());



  void emitSignUpCubit(SignUpRequest signUpRequest) async {
    if (isClosed) return;
    emit(SignUpState.loading());
    final response = await signUpRepos.signUp(signUpRequest);
    if (isClosed) return;
    response.when(
      success: (data) {
        emit(SignUpState.success(data));
      },
      failure: (errorHandler) {
        emit(
          SignUpState.error(message: errorHandler.apiErrorModel.message ?? ''),
        );
      },
    );
  }
  // @override
  // Future<void> close() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   nameController.dispose();
  //   phoneController.dispose();
  //   passwordConfirmationController.dispose();
  //   return super.close();
  // }
}

class ToggleSignUpCubit extends Cubit<ToggleSignUpState> {
  ToggleSignUpCubit()
      : super(const ToggleSignUpState(
    obscure1: true,
    obscure2: true,
  ));

  void toggleObscure1() {
    emit(state.copyWith(obscure1: !state.obscure1));
  }

  void toggleObscure2() {
    emit(state.copyWith(obscure2: !state.obscure2));
  }
}

