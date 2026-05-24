import 'package:supabase_flutter/supabase_flutter.dart';
import 'error.dart';

class AuthErrorHandler {
  static Failure handle(dynamic error) {
    if (error is AuthApiException) {
      switch (error.code) {
        case 'email_address_invalid':
          return Failure('Invalid email address.');

        case 'invalid_credentials':
          return Failure('Email or password is incorrect.');

        case 'over_email_send_rate_limit':
          return Failure('Too many requests. Please try again later.');

        case 'user_already_exists':
          return Failure('User already exists.');

        case 'weak_password':
          return Failure('Password is too weak.');

        case 'otp_expired':
          return Failure('Reset password link expired.');

        case 'access_denied':
          return Failure('Access denied.');

        default:
          return Failure(error.message);
      }
    }

    return Failure('Unexpected error occurred.');
  }
}
