import 'package:json_annotation/json_annotation.dart';
part 'account_entity.g.dart';

@JsonSerializable()
class AccountEntity {
  String? name;
  String? account;
  String? amount;

  AccountEntity(this.name, this.account, this.amount);

  factory AccountEntity.fromJson(Map<String, dynamic> json) => _$AccountEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AccountEntityToJson(this);
}