import 'package:doctor_app/features/profile/data/models/profile_response.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_services.dart';
import '../../../my_appointment/data/models/my_appointment_response.dart';

class ProfileRepos {
  final ApiServices apiServices;

  ProfileRepos(this.apiServices);


  Future<ApiResult<ProfileResponse>> profile()async{

    try{
      final response= await apiServices.profile();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
}