import 'package:doctor_app/botton_nav_bar.dart';
import 'package:doctor_app/core/utils/app_router/routes.dart';
import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';
import 'package:doctor_app/features/auth/presentation/screens/forget_possword/forget_password_screen.dart';
import 'package:doctor_app/features/auth/presentation/screens/sign_in/login_scre.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/screens/update_password/update_password_screen.dart';
import 'package:doctor_app/features/details_doctor/presentation/screen/details_doctors_screen.dart';
import 'package:doctor_app/features/home/presentation/screens/home/home_screen.dart';
import 'package:doctor_app/features/home/presentation/screens/recommendation_doctor/recommendation_doctor_screen.dart';
import 'package:doctor_app/features/home/presentation/screens/specialization/specialization_screen.dart';
import 'package:doctor_app/features/onboarding/onboarding_scre.dart';
import 'package:doctor_app/features/search/search_view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/auth/presentation/screens/sign_up/sign_up_screen.dart';
import '../../../features/book_appointment/domain/entities/appointment_params.dart';
import '../../../features/book_appointment/presentation/controller/book_appointment_cubit.dart';
import '../../../features/book_appointment/presentation/screen/book_appointment/book_appointment_screen.dart';
import '../../../features/book_appointment/presentation/screen/done_appointment/done_appointment.dart';
import '../../../features/home/domain/entities/doctor_entity.dart';
import '../../../features/map_smiple.dart';
import '../../../features/profile/screens/profile/profile_screen.dart';
import '../../../features/profile/screens/update_profile/update_profile_screen.dart';
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
      case Routes.specializationScreen:
        {
          return MaterialPageRoute(builder: (_) => SpecializationScreen());
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
      final arg = settings.arguments as int? ?? 0;
        {
          return MaterialPageRoute(builder: (_) => BottonNavBarView(initialIndex: arg,));
        }
      case Routes.mapSampleScreen:
        {
          return MaterialPageRoute(builder: (_) => const MapSample());
        }
      case Routes.homeScreen:
        {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      case Routes.searchScreen:
        {
          return MaterialPageRoute(builder: (_) => SearchScreen());
        }
      case Routes.recommendationDoctorScreen:
        final isShow = settings.arguments as bool;
        {
          return MaterialPageRoute(
            builder: (_) => RecommendationDoctorScreen(isShow: isShow),
          );
        }
      case Routes.detailsDoctorsScreen:
        final id = settings.arguments as String;
        {
          return MaterialPageRoute(
            builder: (_) =>
                DetailsDoctorsScreen(key: ValueKey(id), doctorId: id),
          );
        }

      case Routes.bookAppointmentScreen:
        {
          final dataForDoctors = settings.arguments as DoctorEntity;
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => sl<BookAppointmentCubit>(),
              child: BookAppointmentScreen(dataForDoctors: dataForDoctors),
            ),
          );
        }
      case Routes.doneAppointments:
        final args = settings.arguments as Map<String, dynamic>;

        final appointmentParams =
            args['appointmentParams'] as AppointmentParams;
        final cubit = args['cubit'] as BookAppointmentCubit;
        final button = args['button'] as Widget;
        final showState = args['showState'] as bool;
        final listener = args['listener'] as Widget;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: DoneAppointmentScreen(
              appointmentParams: appointmentParams,
              showState: showState,
              listener: listener,
              child: button,
            ),
          ),
        );
      case Routes.profilesScreen:
        {
          return MaterialPageRoute(builder: (_) => ProfileScreen());
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
