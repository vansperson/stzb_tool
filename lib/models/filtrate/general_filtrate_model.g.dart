part of 'general_filtrate_model.dart';

GeneralFiltrateModel _$GeneralFiltrateModelFromJson(Map<String, dynamic> json) {
  return GeneralFiltrateModel(
    json['key'] as String,
    json['label'] as String,
    (json['options'] as List)?.map((e) =>
      e == null ? null : GeneralFiltrateOptionModel.fromJson(e as Map<String, dynamic>)
    )?.toList()
  );
}

Map<String, dynamic> _$GeneralFiltrateModelToJson(GeneralFiltrateModel instance) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'options': instance.options,
};
