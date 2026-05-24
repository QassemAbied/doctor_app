import 'package:dio/dio.dart';
import 'package:doctor_app/core/network/api_constants.dart';
import 'package:doctor_app/features/apponitments/data/models/appointment_request.dart';
import 'package:doctor_app/features/apponitments/data/models/appointments_response.dart';
import 'package:doctor_app/features/details_doctor/data/models/details_doctors_models.dart';
import 'package:doctor_app/features/home/data/models/home_models.dart';
import 'package:doctor_app/features/my_appointment/data/models/my_appointment_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST('auth/login')
//  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  // @POST('auth/register')
  // Future<SignUpResponse> signUp(@Body() SignUpRequest signUpRequest);

  @GET('specialization/index')
  Future<HomeModels> home();

  @GET('doctor/show/{id}')
  Future<DetailsDoctorsModels> detailsDoctors( @Path('id') int? id,);

  @POST('appointment/store')
  Future<AppointmentsResponse> appointmentStore(@Body() AppointmentRequest appointmentRequest);

  @GET('appointment/index')
  Future<MyAppointmentResponse> myAppointment();

  // @GET('user/profile')
  // Future<ProfileResponse> profile();
  // @POST('user/update')
  // Future<UpdateProfileResponse> updateUser(@Body() UpdateProfileRequest updateProfileRequest);

}
