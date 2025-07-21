import 'package:json_annotation/json_annotation.dart';

part 'team_info.g.dart';

@JsonSerializable()
class TeamInfo {
  String? name;
  String? shortname;
  String? img;

  TeamInfo({this.name, this.shortname, this.img});

  factory TeamInfo.fromJson(Map<String, dynamic> json) {
    return _$TeamInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TeamInfoToJson(this);
}
