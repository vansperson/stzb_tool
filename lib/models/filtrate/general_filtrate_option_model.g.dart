
part of 'general_filtrate_option_model.dart';

GeneralFiltrateOptionModel _$GeneralFiltrateOptionModelFromJson(Map<String, dynamic> json) {
  return GeneralFiltrateOptionModel(
    json['value'] as String,
    json['label'] as String
  );
}

Map<String, dynamic> _$GeneralFiltrateOptionModelToJson(GeneralFiltrateOptionModel instance) => <String, dynamic>{
  'value': instance.value,
  'label': instance.label
};