part of 'filtrate_hero_model.dart';

FiltrateHeroModel _$FiltrateHeroModelFromJson(Map<String, dynamic> json) {
  return FiltrateHeroModel(
    json['key'] as String,
    json['label'] as String,
    (json['options'] as List)?.map((e) =>
      e == null ? null : FiltrateHeroOptionModel.fromJson(e as Map<String, dynamic>)
    )?.toList()
  );
}

Map<String, dynamic> _$FiltrateHeroModelToJson(FiltrateHeroModel instance) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'options': instance.options,
};

FiltrateHeroOptionModel _$FiltrateHeroOptionModelFromJson(Map<String, dynamic> json) {
  return FiltrateHeroOptionModel(
    json['value'] as String,
    json['label'] as String
  );
}

Map<String, dynamic> _$FiltrateHeroOptionModelToJson(FiltrateHeroOptionModel instance) => <String, dynamic>{
  'value': instance.value,
  'label': instance.label
};