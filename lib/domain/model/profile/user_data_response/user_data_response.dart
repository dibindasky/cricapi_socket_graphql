import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  Data? data;

  UserDataResponse({this.data});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) {
    return _$UserDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}
