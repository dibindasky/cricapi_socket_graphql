// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchList _$MatchListFromJson(Map<String, dynamic> json) => MatchList(
  id: json['id'] as String?,
  name: json['name'] as String?,
  matchType: json['matchType'] as String?,
  status: json['status'] as String?,
  venue: json['venue'] as String?,
  date: json['date'] as String?,
  dateTimeGmt: json['dateTimeGMT'] as String?,
  teams: (json['teams'] as List<dynamic>?)?.map((e) => e as String).toList(),
  fantasyEnabled: json['fantasyEnabled'] as bool?,
  bbbEnabled: json['bbbEnabled'] as bool?,
  hasSquad: json['hasSquad'] as bool?,
  matchStarted: json['matchStarted'] as bool?,
  matchEnded: json['matchEnded'] as bool?,
);

Map<String, dynamic> _$MatchListToJson(MatchList instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'matchType': instance.matchType,
  'status': instance.status,
  'venue': instance.venue,
  'date': instance.date,
  'dateTimeGMT': instance.dateTimeGmt,
  'teams': instance.teams,
  'fantasyEnabled': instance.fantasyEnabled,
  'bbbEnabled': instance.bbbEnabled,
  'hasSquad': instance.hasSquad,
  'matchStarted': instance.matchStarted,
  'matchEnded': instance.matchEnded,
};
