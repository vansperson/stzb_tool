import 'package:json_annotation/json_annotation.dart';
import 'package:stzb_tool/models/filtrate/general_filtrate_option_model.dart';

part 'general_filtrate_model.g.dart';

@JsonSerializable()
class GeneralFiltrateModel {
  String key;
  String label;
  List<GeneralFiltrateOptionModel> options;

  GeneralFiltrateModel(
    this.key,
    this.label,
    this.options
  );

  factory GeneralFiltrateModel.fromJson(Map<String, dynamic> json) => _$GeneralFiltrateModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralFiltrateModelToJson(this);

  GeneralFiltrateModel.empty();
}
