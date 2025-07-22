import 'package:json_annotation/json_annotation.dart';

part 'login_modal.g.dart';

@JsonSerializable()
class LoginModal {
  String? email;
  String? password;

  LoginModal({this.email, this.password});

  factory LoginModal.fromJson(Map<String, dynamic> json) {
    return _$LoginModalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginModalToJson(this);
}
