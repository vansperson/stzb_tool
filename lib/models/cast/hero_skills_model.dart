import 'package:json_annotation/json_annotation.dart';

part 'hero_skills_model.g.dart';

@JsonSerializable()
class HeroSkillsModel {
  String name;
  String skillId;

  HeroSkillsModel(
    this.name,
    this.skillId
  );

  factory HeroSkillsModel.fromJson(Map<String, dynamic> json) => _$HeroSkillsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HeroSkillsToJson(this);

  HeroSkillsModel.empty();
}
