import 'package:json_annotation/json_annotation.dart';

part 'filtrate_hero_model.g.dart';

@JsonSerializable()
class FiltrateHeroModel {
  String key;
  String label;
  List<FiltrateHeroOptionModel> options;

  FiltrateHeroModel(
    this.key,
    this.label,
    this.options
  );

  factory FiltrateHeroModel.fromJson(Map<String, dynamic> json) => _$FiltrateHeroModelFromJson(json);

  Map<String, dynamic> toJson() => _$FiltrateHeroModelToJson(this);

  FiltrateHeroModel.empty();
}

@JsonSerializable()
class FiltrateHeroOptionModel {
  String value;
  String label;

  FiltrateHeroOptionModel(
    this.value,
    this.label
  );

  factory FiltrateHeroOptionModel.fromJson(Map<String, dynamic> json) => _$FiltrateHeroOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FiltrateHeroOptionModelToJson(this);

  FiltrateHeroOptionModel.empty();
}