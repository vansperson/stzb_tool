part of 'method_model.dart';

MethodModel _$MethodModelFromJson(Map<String, dynamic> json) {
  return MethodModel(
    json['methodId'] as int,
    json['methodName'] as String
  );
}

Map<String, dynamic> _$MethodModelToJson(MethodModel instance) => <String, dynamic>{
  'methodId': instance.methodId,
  'methodName': instance.methodName
};