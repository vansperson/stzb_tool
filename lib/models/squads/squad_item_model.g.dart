part of 'squad_item_model.dart';

SquadItemModel _$SquadItemModelFromJson(Map<String, dynamic> json) {
  return SquadItemModel(
    json['generalDetail'] == null ? null : GeneralDetailModel.fromJson(json['generalDetail'] as Map<String, dynamic>),
    json['method1'] == null ? null : MethodModel.fromJson(json['method1'] as Map<String, dynamic>),
    json['method2'] == null ? null : MethodModel.fromJson(json['method2'] as Map<String, dynamic>),
    json['method3'] == null ? null : MethodModel.fromJson(json['method3'] as Map<String, dynamic>)
  );
}

Map<String, dynamic> _$SquadItemModelToJson(SquadItemModel instance) => <String, dynamic>{
  'generalDetail': instance.generalDetail,
  'method1': instance.method1,
  'method2': instance.method2,
  'method3': instance.method3
};