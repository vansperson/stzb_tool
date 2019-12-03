part of 'method_item_model.dart';

MethodItemModel _$MethodItemModelFromJson(Map<String, dynamic> json) {
  return MethodItemModel(
    json['id'] as int, 
    json['name'] as String, 
    json['type'] as String
  );
}

Map<String, dynamic> _$MethodItemModelToJson(MethodItemModel instance) => <String, dynamic>{ 
  'id': instance.id,
  'name': instance.name,
  'type': instance.type
};