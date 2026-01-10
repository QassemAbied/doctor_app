import 'package:doctor_app/features/profile/data/models/update_profile_request.dart';
import 'package:doctor_app/features/profile/data/models/update_profile_response.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_services.dart';
import '../models/profile_response.dart';

class UpdateProfileRepos {
  final ApiServices apiServices;

  UpdateProfileRepos(this.apiServices);

  Future<ApiResult<UpdateProfileResponse>> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  ) async {
    try {
      final response = await apiServices.updateUser(updateProfileRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
