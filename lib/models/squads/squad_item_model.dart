import 'package:json_annotation/json_annotation.dart';
import 'package:stzb_tool/models/global/general_detail_model.dart';
import 'package:stzb_tool/models/squads/method_model.dart';

part 'squad_item_model.g.dart';

@JsonSerializable()
class SquadItemModel {
  GeneralDetailModel generalDetail;
  MethodModel method1;
  MethodModel method2;
  MethodModel method3;

  SquadItemModel(
    this.generalDetail,
    this.method1,
    this.method2,
    this.method3
  );

  factory SquadItemModel.fromJson(Map<String, dynamic> json) => _$SquadItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SquadItemModelToJson(this);

  SquadItemModel.empty();
}