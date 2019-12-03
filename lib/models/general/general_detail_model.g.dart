part of 'general_detail_model.dart'; 

GeneralDetailModel _$GeneralDetailModelFromJson(Map<String, dynamic> json) {
  return GeneralDetailModel(
    json['id'] as int, 
    json['name'] as String, 
    json['quality'] as String, 
    json['contory'] as String,
    json['cost'] as num, 
    json['type'] as String, 
    json['distance'] as int, 
    json['attack'] as num, 
    json['def'] as num, 
    json['ruse'] as num, 
    json['speed'] as num, 
    json['methodId'] as int, 
    json['methodName'] as String,
    (json['methodId1'] == '' || json['methodId1'] == null) ? null : json['methodId1'] as int,
    (json['methodName1'] == '' || json['methodName1'] == null) ? null : json['methodName1'] as String,
    (json['methodId2'] == '' || json['methodId2'] == null) ? null : json['methodId2'] as int,
    (json['methodName2'] == '' || json['methodName2'] == null)  ? null : json['methodName2'] as String,
    (json['methodId3'] == '' || json['methodId3'] == null) ? null : json['methodId3'] as int,
    (json['methodName3'] == '' || json['methodName3'] == null)  ? null : json['methodName3'] as String
  );
}

Map<String, dynamic> _$GeneralDetailModelToJson(GeneralDetailModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'quality': instance.quality,
  'contory': instance.contory,
  'cost': instance.cost,
  'type': instance.type,
  'distance': instance.distance,
  'attack': instance.attack,
  'def': instance.def,
  'ruse': instance.ruse,
  'speed': instance.speed,
  'methodId': instance.methodId,
  'methodName': instance.methodName,
  'methodId1': instance.methodId1,
  'methodName1': instance.methodName1,
  'methodId1': instance.methodId2,
  'methodName1': instance.methodName2,
  'methodId1': instance.methodId3,
  'methodName1': instance.methodName3
};