




import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_response.g.dart';
@JsonSerializable()
class ProfileResponse {
 final String? message;
 final List<Data>? data;
 final bool? status;
 final int? code;

  ProfileResponse({this.message, this.data, this.status, this.code});


 factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
     _$ProfileResponseFromJson(json);

 Map<String, dynamic> toJson() =>_$ProfileResponseToJson(this);
}
@JsonSerializable()
class Data {
 final int? id;
 final String? name;
 final String? email;
 final String? phone;
 final String? gender;

  Data({this.id, this.name, this.email, this.phone, this.gender});

 factory Data.fromJson(Map<String, dynamic> json) =>
     _$DataFromJson(json);

 Map<String, dynamic> toJson() =>_$DataToJson(this);
}