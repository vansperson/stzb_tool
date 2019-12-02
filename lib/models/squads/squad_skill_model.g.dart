part of 'squad_skill_model.dart';

SquadSkillModel _$SquadSkillModelFromJson(Map<String, dynamic> json) {
  return SquadSkillModel(
    json['name'] as String,
    json['skillId'] as String
  );
}

Map<String, dynamic> _$SquadSkillModelToJson(SquadSkillModel instance) => <String, dynamic>{
  'name': instance.name,
  'skillId': instance.skillId
};