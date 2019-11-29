part of 'hero_skills_model.dart';

HeroSkillsModel _$HeroSkillsModelFromJson(Map<String, dynamic> json) {
  return HeroSkillsModel(
    json['name'] as String,
    json['skillId'] as String
  );
}

Map<String, dynamic> _$HeroSkillsToJson(HeroSkillsModel instance) => <String, dynamic>{
  'name': instance.name,
  'skillId': instance.skillId
};