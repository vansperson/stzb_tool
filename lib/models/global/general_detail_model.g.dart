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
    json['methodId1'] == '' ? null : json['methodId1'] as int,
    json['methodName1'] == '' ? null : json['methodName1'] as String
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
  'methodName1': instance.methodName1
};