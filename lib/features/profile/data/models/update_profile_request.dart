

import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_profile_request.g.dart';
@JsonSerializable()
class UpdateProfileRequest {
  final String? name;
  final String? email;
  final String? phone;
  //final String? password;
  final int? gender;

  UpdateProfileRequest(
      this.name,
      this.email,
      this.phone,
     // this.password,
      this.gender);
  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() =>_$UpdateProfileRequestToJson(this);
}