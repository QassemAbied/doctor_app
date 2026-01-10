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
  final formKey= GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordConfirmationController=TextEditingController();
  // bool obscure1 = true;
  // bool obscure2 = true;
  //
  // void toggleObscure1() {
  //   // obscure1 = !obscure1;
  //   // emit(SignUpState.changeObscure());
  //   emit(state.copyWith(obscure1: !state.obscure1));
  // }
  // void toggleObscure2() {
  //   // obscure2 = !obscure2;
  //   // emit(SignUpState.changeObscure2());
  //   emit(state.copyWith(obscure2: !state.obscure2));
  // }

  void emitSignUpCubit(SignUpRequest signUpRequest) async {
    emit(SignUpState.loading());
    final response = await signUpRepos.signUp(signUpRequest);
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

