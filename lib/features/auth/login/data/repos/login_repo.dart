import 'package:doctor_app/core/network/api_error_handler.dart';
import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/core/network/api_services.dart';

import '../models/login_request_body.dart';
import '../models/login_response.dart';

 class LoginRepo {
  final ApiServices _apiServices;

  LoginRepo(this._apiServices);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequest)async{
    try{
      final response=await _apiServices.login(LoginRequestBody(email:loginRequest.email  ,
          password: loginRequest.password));
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}