import 'package:json_annotation/json_annotation.dart';

part 'squad_skill_model.g.dart';

@JsonSerializable()
class SquadSkillModel {
  String name;
  String skillId;

  SquadSkillModel(
    this.name,
    this.skillId
  );

  factory SquadSkillModel.fromJson(Map<String, dynamic> json) => _$SquadSkillModelFromJson(json);

  Map<String, dynamic> toJson() => _$SquadSkillModelToJson(this);

  SquadSkillModel.empty();
}
