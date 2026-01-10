


import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_profile_response.g.dart';
@JsonSerializable()
class UpdateProfileResponse {
 final String? message;
 final Data? data;
 final bool? status;
 final int? code;

  UpdateProfileResponse({this.message, this.data, this.status, this.code});

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$UpdateProfileResponseToJson(this);
}
@JsonSerializable()
class Data {
final  int? id;
 final String? name;
 final String? email;
 final String? phone;
 final String? gender;
 //final Null? emailVerifiedAt;
 final String? createdAt;
 final String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.gender,
       // this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() =>_$DataToJson(this);
}