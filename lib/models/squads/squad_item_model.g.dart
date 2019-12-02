part of 'squad_item_model.dart';

SquadItemModel _$SquadItemModelFromJson(Map<String, dynamic> json) {
  return SquadItemModel(
    json['name'] as String,
    json['avatarId'] as String,
    json['cost'] as double,
    json['masterSkill'] == null 
      ? null
      : SquadSkillModel.fromJson(json['masterSkill'] as Map<String, dynamic>),
    json['secondSkill'] == null 
      ? null
      : SquadSkillModel.fromJson(json['secondSkill'] as Map<String, dynamic>),
    json['thirdlySkill'] == null 
      ? null
      : SquadSkillModel.fromJson(json['thirdlySkill'] as Map<String, dynamic>)
  );
}

Map<String, dynamic> _$SquadItemModelToJson(SquadItemModel instance) => <String, dynamic>{
  'name': instance.name,
  'avatarId': instance.avatarId,
  'cost': instance.cost,
  'masterSkill': instance.masterSkill,
  'secondSkill': instance.secondSkill,
  'thirdlySkill': instance.thirdlySkill
};