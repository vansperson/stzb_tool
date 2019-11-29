import 'package:json_annotation/json_annotation.dart';
import 'package:stzb_tool/models/cast/hero_skills_model.dart';

part 'hero_config_model.g.dart';

@JsonSerializable()
class HeroConfigModel {
  String name;
  String avatarId;
  double cost;
  HeroSkillsModel masterSkill;
  HeroSkillsModel secondSkill;
  HeroSkillsModel thirdlySkill;

  HeroConfigModel(
    this.name,
    this.avatarId,
    this.cost,
    this.masterSkill,
    this.secondSkill,
    this.thirdlySkill
  );

  factory HeroConfigModel.fromJson(Map<String, dynamic> json) => _$HeroConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$HeroConfigModelToJson(this);

  HeroConfigModel.empty();
}