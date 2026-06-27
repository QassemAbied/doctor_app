import '../services/shared_pref/shared_pref_helpers.dart';
import '../services/shared_pref/shared_pref_keys.dart';
import '../utils/extension.dart';

class AppStartupState {
  static bool isLoggedIn = false;
  static bool isOnBoardingCompleted = false;
  static bool isDoctor = false;
}

class AppStartupHelper {
  static Future<void> init() async {
    await _checkLoggedInUser();
    await _checkOnBoarding();
    await _checkUserRole();
  }

  static Future<void> _checkOnBoarding() async {
    final isOnBoarding = await SharedPrefHelper.getBool(
      SharedPrefKeys.isOnBoarding,
    );

    AppStartupState.isOnBoardingCompleted = isOnBoarding != true;
  }

  static Future<void> _checkLoggedInUser() async {
    final userToken = await SharedPrefHelper.getString(SharedPrefKeys.userId);

    AppStartupState.isLoggedIn = !userToken.isNullOrEmpty();
  }

  static Future<void> _checkUserRole() async {
    final userRole = await SharedPrefHelper.getString(SharedPrefKeys.userRole);

    AppStartupState.isDoctor = userRole == 'doctor';
  }
}
