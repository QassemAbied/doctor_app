import 'package:doctor_app/core/services/location/location_service.dart';
import 'package:doctor_app/core/services/supa_base_service/book_appointment_service.dart';
import 'package:doctor_app/core/services/supa_base_service/supa_base_chat_service.dart';
import 'package:doctor_app/core/services/supa_base_service/supa_base_doctor_details_service.dart';
import 'package:doctor_app/core/services/supa_base_service/supa_base_doctor_specialization_services.dart';
import 'package:doctor_app/features/auth/domain/use_case/get_user_uescase.dart';
import 'package:doctor_app/features/auth/domain/use_case/sign_out_usecase.dart';
import 'package:doctor_app/features/auth/domain/use_case/update_user_usecase.dart';
import 'package:doctor_app/features/book_appointment/data/data_source/remote_data_source/appointment_remote_data_source.dart';
import 'package:doctor_app/features/book_appointment/domain/repository.dart';
import 'package:doctor_app/features/book_appointment/domain/use_case/book_appointment_usecase.dart';
import 'package:doctor_app/features/book_appointment/presentation/controller/book_appointment_cubit.dart';
import 'package:doctor_app/features/chat/presentation/controller/chat_cubit.dart';
import 'package:doctor_app/features/details_doctor/data/data_source/remote_data_source/details_remote_data_source.dart';
import 'package:doctor_app/features/details_doctor/domain/repository.dart';
import 'package:doctor_app/features/details_doctor/domain/use_case/get_doctor_by_id_usecase.dart';
import 'package:doctor_app/features/details_doctor/presentation/controller/doctor_details_cubit.dart';
import 'package:doctor_app/features/home/data/data_source/remote_data_Source/home_remote_data_source.dart';
import 'package:doctor_app/features/home/data/data_source/remote_data_Source/home_remote_data_source_impl.dart';
import 'package:doctor_app/features/home/data/repository_impl.dart';
import 'package:doctor_app/features/home/domain/repository.dart';
import 'package:doctor_app/features/home/domain/use_case/doctor_usecase.dart';
import 'package:doctor_app/features/home/domain/use_case/get_specialization_usecase.dart';
import 'package:doctor_app/features/home/presentation/controller/doctor/doctors_cubit.dart';
import 'package:doctor_app/features/home/presentation/controller/recommendation/recommendation_cubit.dart';
import 'package:doctor_app/features/home/presentation/controller/specialization/specialization_cubit.dart';
import 'package:doctor_app/features/notification/data/data_source/remote_data_source/local_notification_remote_data_source.dart';
import 'package:doctor_app/features/notification/domain/use_case/add_local_notification_usecase.dart';
import 'package:doctor_app/features/notification/domain/use_case/get_local_notification_usecase.dart';
import 'package:get_it/get_it.dart';
import '../../../features/auth/data/data_source/auth_remote_data_source.dart';
import '../../../features/auth/data/data_source/auth_remote_data_source_impl.dart';
import '../../../features/auth/data/repository_impl.dart';
import '../../../features/auth/domain/repository.dart';
import '../../../features/auth/domain/use_case/forget_password_usecase.dart';
import '../../../features/auth/domain/use_case/sign_in_usecase.dart';
import '../../../features/auth/domain/use_case/sign_up_usecase.dart';
import '../../../features/auth/domain/use_case/update_password_usecase.dart';
import '../../../features/auth/presentation/controller/auth_cubit.dart';
import '../../../features/book_appointment/data/data_source/remote_data_source/appointment_remote_data_source_impl.dart';
import '../../../features/book_appointment/data/repository_impl.dart';
import '../../../features/book_appointment/domain/use_case/cancel_appointment_usecase.dart';
import '../../../features/book_appointment/domain/use_case/reschedule_appointment_uescase.dart';
import '../../../features/book_appointment/domain/use_case/my_appointment_usecase.dart';
import '../../../features/chat/data/data_source/remote_data_source/chat_remote_data_source.dart';
import '../../../features/chat/data/data_source/remote_data_source/chat_remote_data_source_impl.dart';
import '../../../features/chat/data/repository_impl.dart';
import '../../../features/chat/domain/repository.dart';
import '../../../features/chat/domain/use_case/get_all_message_usecase.dart';
import '../../../features/chat/domain/use_case/get_message_usecase.dart';
import '../../../features/chat/domain/use_case/send_message.dart';
import '../../../features/details_doctor/data/data_source/remote_data_source/details_remote_data_source_impl.dart';
import '../../../features/details_doctor/data/repository_impl.dart';
import '../../../features/notification/data/data_source/remote_data_source/local_notification_remote_data_source_impl.dart';
import '../../../features/notification/data/repository_impl.dart';
import '../../../features/notification/domain/repository.dart';
import '../../../features/notification/presentation/controller/notification_cubit.dart';
import '../../services/supa_base_service/supa_base_auth_service.dart';
import '../../services/supa_base_service/supa_base_notification_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AuthCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()));

  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePasswordUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUesCase(sl()));
  sl.registerLazySingleton(() => UpdateUserUseCase(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton(() => SupAbaseAuthService());

  sl.registerFactory(() => RecommendationCubit(sl(), sl(), sl()));

  sl.registerLazySingleton(() => SpecializationCubit(sl()));
  sl.registerLazySingleton(() => DoctorCubit(sl()));
  sl.registerLazySingleton(() => LocationService());

  sl.registerLazySingleton(() => GetSpecializationUseCase(sl()));
  sl.registerLazySingleton(() => GetDoctorsUseCase(sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerLazySingleton(() => SupABaseDoctorsSpecializationServices());

  sl.registerFactory(() => DoctorDetailsCubit(sl()));

  sl.registerLazySingleton(() => GetDoctorByIdUseCase(sl()));
  sl.registerLazySingleton<DetailsRemoteDataSource>(
    () => DetailsRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<DetailsRepository>(
    () => DetailsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => SupABaseDoctorDetailsService());

  sl.registerFactory(() => BookAppointmentCubit(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => RescheduleAppointmentUesCase(sl()));
  sl.registerLazySingleton(() => CancelAppointmentUseCase(sl()));
  sl.registerLazySingleton(() => MyAppointmentUseCase(sl()));

  sl.registerLazySingleton(() => BookAppointmentUseCase(sl()));
  sl.registerLazySingleton<AppointmentRemoteDataSource>(
    () => AppointmentRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AppointmentRepository>(
    () => AppointmentRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => BookAppointmentService());

  sl.registerFactory(() => NotificationCubit(sl(), sl(), sl()));

  sl.registerLazySingleton(() => AddLocalNotificationUseCase(sl()));
  sl.registerLazySingleton(() => GetLocalNotificationUseCase(sl()));
  sl.registerLazySingleton<LocalNotificationRepository>(
    () => LocalNotificationRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<LocalNotificationRemoteDataSource>(
    () => LocalNotificationRemoteDataSourceImpl(sl()),

  );
  sl.registerLazySingleton(() => SupABaseNotificationService());


  sl.registerFactory(() => ChatCubit(sl(), sl(),sl()));
  sl.registerLazySingleton(() => GetAllChatsUseCase(sl()));
  sl.registerLazySingleton(() => GetMessagesUseCase(sl()));
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  sl.registerLazySingleton<ChatRepository>(
        () => ChatRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ChatRemoteDataSource>(
        () => ChatRemoteDataSourceImpl(sl()),

  );
  sl.registerLazySingleton(() => SupABaseChatService());

}
