// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesInfo _$SeriesInfoFromJson(Map<String, dynamic> json) => SeriesInfo(
  info:
      json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
  matchList:
      (json['matchList'] as List<dynamic>?)
          ?.map((e) => MatchList.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SeriesInfoToJson(SeriesInfo instance) =>
    <String, dynamic>{'info': instance.info, 'matchList': instance.matchList};
