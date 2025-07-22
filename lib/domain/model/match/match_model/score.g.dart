// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Score _$ScoreFromJson(Map<String, dynamic> json) => Score(
  r: (json['r'] as num?)?.toInt(),
  w: (json['w'] as num?)?.toInt(),
  o: (json['o'] as num?)?.toDouble(),
  inning: json['inning'] as String?,
);

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
  'r': instance.r,
  'w': instance.w,
  'o': instance.o,
  'inning': instance.inning,
};
