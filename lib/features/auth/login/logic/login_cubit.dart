import 'package:doctor_app/core/helpers/constants.dart';
import 'package:doctor_app/core/helpers/shared_pref_helpers.dart';
import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/core/network/dio_factory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/login_request_body.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  
  void emitLoginCubit(LoginRequestBody loginRequestBody)async{
    emit(const LoginState.loading());
    final response= await _loginRepo.login(loginRequestBody);
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

  Future<void> userSaveToken(String token) async {
   await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
   DioFactory.setTokenAfterLogin(token);
  }
}
