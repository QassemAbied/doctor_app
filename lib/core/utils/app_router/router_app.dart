import 'package:doctor_app/botton_nav_bar.dart';
import 'package:doctor_app/core/utils/app_router/routes.dart';
import 'package:doctor_app/features/apponitments/logic/appiotment_store_cubit.dart';
import 'package:doctor_app/features/apponitments/view/appointments_screen.dart';
import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';
import 'package:doctor_app/features/auth/presentation/screens/forget_possword/forget_password_screen.dart';
import 'package:doctor_app/features/auth/presentation/screens/sign_in/login_scre.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/screens/update_password/update_password_screen.dart';
import 'package:doctor_app/features/details_doctor/view/details_doctors_screen.dart';
import 'package:doctor_app/features/home/home_view/home_screen.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/my_appointment/logic/my_appointment_cubit.dart';
import 'package:doctor_app/features/my_appointment/view/my_appointment_screen.dart';
import 'package:doctor_app/features/onboarding/onboarding_scre.dart';
import 'package:doctor_app/features/search/search_view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/auth/presentation/screens/sign_up/sign_up_screen.dart';
import '../../../features/details_doctor/data/models/details_doctors_models.dart';
import '../../../features/map_smiple.dart';
import '../../../features/profile/screens/profile/profile_screen.dart';
import '../../../features/profile/screens/update_profile/update_profile_screen.dart';
import '../../di/dependey.dart';
import '../di/injection_container.dart';


class RouterApp {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        {
          return MaterialPageRoute(builder: (_) => OnboardingScreen());
        }
      case Routes.loginScreen:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: LoginScreen(),
            ),
          );
        }
      case Routes.forgetScreen:
        {
          return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
        }
      case Routes.updatePasswordScreen:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: UpdatePasswordScreen(),
            ),
          );
        }
      case Routes.signUpScreen:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: SignUpScreen(),
            ),
          );
        }

      case Routes.bottonNavScreen:
        {
          return MaterialPageRoute(builder: (_) => BottonNavBarView());
        }
      case Routes.mapSampleScreen:
        {
          return MaterialPageRoute(builder: (_) => MapSample());
        }
      case Routes.homeScreen:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<HomeCubit>()),
                // BlocProvider(
                //   create: (context) => getIt<ProfileCubit>()..emitProfile(),
                // ),
              ],
              child: HomeScreen(),
            ),
          );
        }
      case Routes.searchScreen:
        {
          return MaterialPageRoute(builder: (_) => SearchScreen());
        }
      case Routes.detailsDoctorsScreen:
        final id = settings.arguments as int;
        {
          return MaterialPageRoute(
            builder: (_) => DetailsDoctorsScreen(idDoctors: id),
          );
        }
      case Routes.appointmentsScreen:
        final dataForDoctors = settings.arguments as DataForDoctors;
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<AppointmentStoreCubit>(),
              child: AppointmentsScreen(dataForDoctors: dataForDoctors),
            ),
          );
        }
      case Routes.myAppointmentsScreen:
        {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) =>
                  getIt<MyAppointmentCubit>()..emitMyAppointment(),
              child: MyAppointmentScreen(),
            ),
          );
        }
      case Routes.profilesScreen:
        {
          return MaterialPageRoute(
            builder: (_) => ProfileScreen(),
          );
        }
      case Routes.updateProfileScreen:
        final profileResponse = settings.arguments as UserEntity;

        return MaterialPageRoute(
          builder: (context) => UpdateProfileScreen(userData: profileResponse),
        );
      default:
        {
          return null;
        }
    }
  }
}
