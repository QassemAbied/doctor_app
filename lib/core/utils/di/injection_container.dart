import 'package:doctor_app/features/auth/domain/use_case/get_user_uescase.dart';
import 'package:doctor_app/features/auth/domain/use_case/sign_out_usecase.dart';
import 'package:doctor_app/features/auth/domain/use_case/update_user_usecase.dart';
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
import '../../services/supa_base_service/supa_base_auth_service.dart';

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
}
