// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
  id: json['id'] as String?,
  name: json['name'] as String?,
  startdate: json['startdate'] as String?,
  startDate: json['startDate'] as String?,
  enddate: json['enddate'] as String?,
  endDate: json['endDate'] as String?,
  odi: (json['odi'] as num?)?.toInt(),
  t20: (json['t20'] as num?)?.toInt(),
  test: (json['test'] as num?)?.toInt(),
  squads: (json['squads'] as num?)?.toInt(),
  matches: (json['matches'] as num?)?.toInt(),
);

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'startdate': instance.startdate,
  'startDate': instance.startDate,
  'enddate': instance.enddate,
  'endDate': instance.endDate,
  'odi': instance.odi,
  't20': instance.t20,
  'test': instance.test,
  'squads': instance.squads,
  'matches': instance.matches,
};
