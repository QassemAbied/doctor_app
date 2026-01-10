import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  final int gender;
  final String name;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  SignUpRequest({
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.name, required this.gender,
  });
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
