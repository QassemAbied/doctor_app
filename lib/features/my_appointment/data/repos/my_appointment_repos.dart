import 'package:doctor_app/core/network/api_error_handler.dart';
import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/core/network/api_services.dart';
import 'package:doctor_app/features/my_appointment/data/models/my_appointment_response.dart';

class MyAppointmentRepos {
  final ApiServices apiServices;

  MyAppointmentRepos(this.apiServices);


  Future<ApiResult<MyAppointmentResponse>> myAppointment()async{

    try{
      final response= await apiServices.myAppointment();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
}