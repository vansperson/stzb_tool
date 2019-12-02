import 'package:json_annotation/json_annotation.dart';

part 'general_filtrate_option_model.g.dart';

@JsonSerializable()
class GeneralFiltrateOptionModel {
  String value;
  String label;

  GeneralFiltrateOptionModel(
    this.value,
    this.label
  );

  factory GeneralFiltrateOptionModel.fromJson(Map<String, dynamic> json) => _$GeneralFiltrateOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralFiltrateOptionModelToJson(this);

  GeneralFiltrateOptionModel.empty();
}