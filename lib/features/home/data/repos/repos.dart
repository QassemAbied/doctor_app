import 'package:doctor_app/core/network/api_error_handler.dart';
import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/core/network/api_services.dart';
import 'package:doctor_app/features/home/data/models/home_models.dart';

class HomeRepo {
  final ApiServices _apiServices;

  HomeRepo(this._apiServices);

  Future<ApiResult<HomeModels>> home() async {
    try {
      final response = await _apiServices.home();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
