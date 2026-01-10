import 'package:doctor_app/core/network/api_error_handler.dart';
import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/core/network/api_services.dart';
import 'package:doctor_app/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:doctor_app/features/auth/sign_up/data/models/sign_up_response.dart';

class SignUpRepos {
  final ApiServices apiServices;

  SignUpRepos(this.apiServices);
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequest signUpRequest) async {
    try {
      final response = await apiServices.signUp(
        SignUpRequest(




          email: signUpRequest.email,
          phone:  signUpRequest.phone,
          password: signUpRequest.password,
          passwordConfirmation:signUpRequest.passwordConfirmation,
          name: signUpRequest.name, gender: 0,
        ),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
