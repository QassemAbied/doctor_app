import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/core/network/api_services.dart';
import 'package:doctor_app/features/details_doctor/data/models/details_doctors_models.dart';

import '../../../../core/network/api_error_handler.dart';

class DetailsDoctorsRepos{
  final ApiServices apiServices;

  DetailsDoctorsRepos(this.apiServices);

  Future<ApiResult<DetailsDoctorsModels>> detailsDoctors(int? id)async{
    try{
      final response = await apiServices.detailsDoctors(id);
     return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
}