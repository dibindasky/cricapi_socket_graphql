import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  String? id;
  String? name;
  String? country;

  Player({this.id, this.name, this.country});

  factory Player.fromJson(Map<String, dynamic> json) {
    return _$PlayerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
