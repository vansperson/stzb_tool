part of 'hero_cast_model.dart';

HeroCastModel _$HeroCastModelFromJson(Map<String, dynamic> json) {
  return HeroCastModel(
    json['camp'] == null
      ? null
      : HeroConfigModel.fromJson(json['camp'] as Map<String, dynamic>),
    json['central'] == null
      ? null
      : HeroConfigModel.fromJson(json['central'] as Map<String, dynamic>),
    json['forward'] == null
      ? null
      : HeroConfigModel.fromJson(json['forward'] as Map<String, dynamic>), 
  );
}

Map<String, dynamic> _$HeroCastModelToJson(HeroCastModel instance) => <String, dynamic>{
  'camp': instance.camp,
  'central': instance.central,
  'forward': instance.forward,
};