// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  matchType: json['matchType'] as String?,
  status: json['status'] as String?,
  venue: json['venue'] as String?,
  date: json['date'] as String?,
  dateTimeGmt: json['dateTimeGMT'] as String?,
  teams: (json['teams'] as List<dynamic>?)?.map((e) => e as String).toList(),
  teamInfo:
      (json['teamInfo'] as List<dynamic>?)
          ?.map((e) => TeamInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
  score:
      (json['score'] as List<dynamic>?)
          ?.map((e) => Score.fromJson(e as Map<String, dynamic>))
          .toList(),
  seriesId: json['series_id'] as String?,
  fantasyEnabled: json['fantasyEnabled'] as bool?,
  bbbEnabled: json['bbbEnabled'] as bool?,
  hasSquad: json['hasSquad'] as bool?,
  matchStarted: json['matchStarted'] as bool?,
  matchEnded: json['matchEnded'] as bool?,
);

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'matchType': instance.matchType,
      'status': instance.status,
      'venue': instance.venue,
      'date': instance.date,
      'dateTimeGMT': instance.dateTimeGmt,
      'teams': instance.teams,
      'teamInfo': instance.teamInfo,
      'score': instance.score,
      'series_id': instance.seriesId,
      'fantasyEnabled': instance.fantasyEnabled,
      'bbbEnabled': instance.bbbEnabled,
      'hasSquad': instance.hasSquad,
      'matchStarted': instance.matchStarted,
      'matchEnded': instance.matchEnded,
    };
