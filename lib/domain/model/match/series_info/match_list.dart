import 'package:json_annotation/json_annotation.dart';

import 'team_info.dart';

part 'match_list.g.dart';

@JsonSerializable()
class MatchList {
  String? id;
  String? name;
  String? matchType;
  String? status;
  String? venue;
  String? date;
  @JsonKey(name: 'dateTimeGMT')
  String? dateTimeGmt;
  List<String>? teams;
  // List<TeamInfo>? teamInfo;
  bool? fantasyEnabled;
  bool? bbbEnabled;
  bool? hasSquad;
  bool? matchStarted;
  bool? matchEnded;

  MatchList({
    this.id,
    this.name,
    this.matchType,
    this.status,
    this.venue,
    this.date,
    this.dateTimeGmt,
    this.teams,
    // this.teamInfo,
    this.fantasyEnabled,
    this.bbbEnabled,
    this.hasSquad,
    this.matchStarted,
    this.matchEnded,
  });

  factory MatchList.fromJson(Map<String, dynamic> json) {
    return _$MatchListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchListToJson(this);
}
