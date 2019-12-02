import 'package:json_annotation/json_annotation.dart';
import 'package:stzb_tool/models/squads/squad_skill_model.dart';

part 'squad_item_model.g.dart';

@JsonSerializable()
class SquadItemModel {
  String name;
  String avatarId;
  double cost;
  SquadSkillModel masterSkill;
  SquadSkillModel secondSkill;
  SquadSkillModel thirdlySkill;

  SquadItemModel(
    this.name,
    this.avatarId,
    this.cost,
    this.masterSkill,
    this.secondSkill,
    this.thirdlySkill
  );

  factory SquadItemModel.fromJson(Map<String, dynamic> json) => _$SquadItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SquadItemModelToJson(this);

  SquadItemModel.empty();
}