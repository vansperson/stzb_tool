import 'package:json_annotation/json_annotation.dart';
import 'package:stzb_tool/models/cast/hero_config_model.dart';

part 'hero_cast_model.g.dart';

@JsonSerializable()
class HeroCastModel {
  HeroConfigModel camp;
  HeroConfigModel central;
  HeroConfigModel forward;

  HeroCastModel(
    this.camp,
    this.central,
    this.forward
  );

  factory HeroCastModel.fromJson(Map<String, dynamic> json) => _$HeroCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$HeroCastModelToJson(this);

  HeroCastModel.empty();
}