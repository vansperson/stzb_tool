part of 'hero_config_model.dart';

HeroConfigModel _$HeroConfigModelFromJson(Map<String, dynamic> json) {
  return HeroConfigModel(
    json['name'] as String,
    json['avatarId'] as String,
    json['cost'] as double,
    json['masterSkill'] == null 
      ? null
      : HeroSkillsModel.fromJson(json['masterSkill'] as Map<String, dynamic>),
    json['secondSkill'] == null 
      ? null
      : HeroSkillsModel.fromJson(json['secondSkill'] as Map<String, dynamic>),
    json['thirdlySkill'] == null 
      ? null
      : HeroSkillsModel.fromJson(json['thirdlySkill'] as Map<String, dynamic>)
  );
}

Map<String, dynamic> _$HeroConfigModelToJson(HeroConfigModel instance) => <String, dynamic>{
  'name': instance.name,
  'avatarId': instance.avatarId,
  'cost': instance.cost,
  'masterSkill': instance.masterSkill,
  'secondSkill': instance.secondSkill,
  'thirdlySkill': instance.thirdlySkill
};