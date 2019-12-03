part of 'squads_model.dart';

SquadsModel _$SquadsModelFromJson(Map<String, dynamic> json) {
  return SquadsModel(
    json['camp'] == null ? null: GeneralDetailModel.fromJson(json['camp'] as Map<String, dynamic>),
    json['central'] == null ? null : GeneralDetailModel.fromJson(json['central'] as Map<String, dynamic>),
    json['forward'] == null ? null : GeneralDetailModel.fromJson(json['forward'] as Map<String, dynamic>), 
  );
}

Map<String, dynamic> _$SquadsModelToJson(SquadsModel instance) => <String, dynamic>{
  'camp': instance.camp,
  'central': instance.central,
  'forward': instance.forward,
};