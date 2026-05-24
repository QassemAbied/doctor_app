import 'package:dio/dio.dart';
import 'package:doctor_app/core/network/api_services.dart';
import 'package:doctor_app/core/network/dio_factory.dart';
import 'package:doctor_app/features/apponitments/data/repos/appointment_repos.dart';
import 'package:doctor_app/features/apponitments/logic/appiotment_store_cubit.dart';
import 'package:doctor_app/features/details_doctor/data/repos/repos.dart';
import 'package:doctor_app/features/details_doctor/logic/details_doctors_cubit.dart';
import 'package:doctor_app/features/home/data/repos/repos.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/my_appointment/data/repos/my_appointment_repos.dart';
import 'package:doctor_app/features/my_appointment/logic/my_appointment_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  //getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // getIt.registerLazySingleton<SignUpRepos>(() => SignUpRepos(getIt()));
  // getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt()));
  //
  // getIt.registerLazySingleton<ToggleSignUpCubit>(() => ToggleSignUpCubit());

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  getIt.registerLazySingleton<DetailsDoctorsRepos>(
    () => DetailsDoctorsRepos(getIt()),
  );
  getIt.registerFactory<DetailsDoctorsCubit>(
    () => DetailsDoctorsCubit(getIt()),
  );

  getIt.registerLazySingleton<AppointmentRepos>(
    () => AppointmentRepos(getIt()),
  );
  getIt.registerFactory<AppointmentStoreCubit>(
    () => AppointmentStoreCubit(getIt()),
  );

  getIt.registerLazySingleton<MyAppointmentRepos>(
    () => MyAppointmentRepos(getIt()),
  );
  getIt.registerLazySingleton<MyAppointmentCubit>(
    () => MyAppointmentCubit(getIt()),
  );

  // getIt.registerLazySingleton<ProfileRepos>(() => ProfileRepos(getIt()));
  // getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));
  //
  // getIt.registerLazySingleton<UpdateProfileRepos>(
  //   () => UpdateProfileRepos(getIt()),
  // );
  // getIt.registerLazySingleton<UpdateProfileCubit>(
  //   () => UpdateProfileCubit(getIt()),
  // );
}
