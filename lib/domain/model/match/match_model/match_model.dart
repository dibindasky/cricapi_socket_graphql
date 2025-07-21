import 'package:json_annotation/json_annotation.dart';

import 'score.dart';
import 'team_info.dart';

part 'match_model.g.dart';

@JsonSerializable()
class MatchModel {
  String? id;
  String? name;
  String? matchType;
  String? status;
  String? venue;
  String? date;
  @JsonKey(name: 'dateTimeGMT')
  String? dateTimeGmt;
  List<String>? teams;
  List<TeamInfo>? teamInfo;
  List<Score>? score;
  @JsonKey(name: 'series_id')
  String? seriesId;
  bool? fantasyEnabled;
  bool? bbbEnabled;
  bool? hasSquad;
  bool? matchStarted;
  bool? matchEnded;

  MatchModel({
    this.id,
    this.name,
    this.matchType,
    this.status,
    this.venue,
    this.date,
    this.dateTimeGmt,
    this.teams,
    this.teamInfo,
    this.score,
    this.seriesId,
    this.fantasyEnabled,
    this.bbbEnabled,
    this.hasSquad,
    this.matchStarted,
    this.matchEnded,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return _$MatchModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}
