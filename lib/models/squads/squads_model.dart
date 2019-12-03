import 'package:json_annotation/json_annotation.dart';
import 'package:stzb_tool/models/general/general_detail_model.dart';

part 'squads_model.g.dart';

@JsonSerializable()
class SquadsModel {
  GeneralDetailModel camp;
  GeneralDetailModel central;
  GeneralDetailModel forward;

  SquadsModel(
    this.camp,
    this.central,
    this.forward
  );

  factory SquadsModel.fromJson(Map<String, dynamic> json) => _$SquadsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SquadsModelToJson(this);

  SquadsModel.empty();
}