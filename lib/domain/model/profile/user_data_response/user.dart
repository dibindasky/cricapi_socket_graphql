import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? website;
  String? username;
  Address? address;
  Company? company;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.website,
    this.username,
    this.address,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
