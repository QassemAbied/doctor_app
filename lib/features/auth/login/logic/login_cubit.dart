import 'package:doctor_app/core/helpers/constants.dart';
import 'package:doctor_app/core/helpers/shared_pref_helpers.dart';
import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/core/network/dio_factory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/login_request_body.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());




  
  void emitLoginCubit(LoginRequestBody loginRequestBody)async{
    if (isClosed) return;
    emit(const LoginState.loading());
    final response= await _loginRepo.login(loginRequestBody);
    if (isClosed) return;
    response.when(
        success: (loginResponse) async{
          await userSaveToken(loginResponse.userData?.token??'');
          emit(LoginState.success(loginResponse));
        }, 
        failure: (error){
          emit(LoginState.error(error: error.apiErrorModel.message ??''));
        }
    );
  }
  // @override
  // Future<void> close() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   return super.close();
  // }
  Future<void> userSaveToken(String token) async {
   await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  // DioFactory.setTokenAfterLogin(token);
  }
}


class ToggleLoginCubit extends Cubit<ToggleLoginState> {
  ToggleLoginCubit()
      : super(const ToggleLoginState(
    obscure: true,
  ));

  void toggleObscure() {
    emit(state.copyWith(obscure: !state.obscure));
  }


}

