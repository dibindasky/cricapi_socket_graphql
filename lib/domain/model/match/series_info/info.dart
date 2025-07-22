import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  String? id;
  String? name;
  String? startdate;
  String? startDate;
  String? enddate;
  String? endDate;
  int? odi;
  int? t20;
  int? test;
  int? squads;
  int? matches;

  Info({
    this.id,
    this.name,
    this.startdate,
    this.startDate,
    this.enddate,
    this.endDate,
    this.odi,
    this.t20,
    this.test,
    this.squads,
    this.matches,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
