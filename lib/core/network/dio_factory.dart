import 'package:dio/dio.dart';
import 'package:doctor_app/core/helpers/constants.dart';
import 'package:doctor_app/core/helpers/shared_pref_helpers.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class DioFactory {
//   /// private constructor as I don't want to allow creating an instance of this class
//   DioFactory._();
//
//   static Dio? dio;
//
//   static Dio getDio() {
//     Duration timeOut = const Duration(seconds: 30);
//
//     if (dio == null) {
//       dio = Dio();
//       dio!
//         ..options.connectTimeout = timeOut
//         ..options.receiveTimeout = timeOut;
//       addDioHeaders();
//       addDioInterceptor();
//       return dio!;
//     } else {
//       return dio!;
//     }
//   }
//
//   static void addDioHeaders()async{
//    // final token = await SharedPrefHelper.getToken();
//     dio?.options.headers= {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}'
//     };
//   }
//   static void setTokenAfterLogin(String token){
//     dio?.options.headers= {
//
//       'Authorization':'Bearer $token',
//     };
//   }
//
//   static void addDioInterceptor() {
//     dio?.interceptors.add(
//       PrettyDioLogger(
//         requestBody: true,
//         requestHeader: true,
//         responseHeader: true,
//       ),
//     );
//   }
// }

class DioFactory {
  DioFactory._();
  static Dio? _dio;
  static Dio getDio() {
    if (_dio != null) return _dio!;
    final timeOut = const Duration(seconds: 30);
    _dio = Dio(
      BaseOptions(
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: {'Accept': 'application/json'},
      ),
    );
    _addInterceptors();
    return _dio!;
  }
  static void _addInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SharedPrefHelper.getSecuredString(
            SharedPrefKeys.userToken,
          );
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
    _dio!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
