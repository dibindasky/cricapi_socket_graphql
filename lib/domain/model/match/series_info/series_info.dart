import 'package:json_annotation/json_annotation.dart';

import 'info.dart';
import 'match_list.dart';

part 'series_info.g.dart';

@JsonSerializable()
class SeriesInfo {
  Info? info;
  List<MatchList>? matchList;

  SeriesInfo({this.info, this.matchList});

  factory SeriesInfo.fromJson(Map<String, dynamic> json) {
    return _$SeriesInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeriesInfoToJson(this);
}
