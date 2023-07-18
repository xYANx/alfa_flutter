import 'package:json_annotation/json_annotation.dart';
part 'analytic_entity.g.dart';

@JsonSerializable()
class AnalyticEntity {
  String? name;

  AnalyticEntity(this.name);

  factory AnalyticEntity.fromJson(Map<String, dynamic> json) => _$AnalyticEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AnalyticEntityToJson(this);
}