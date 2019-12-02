import 'package:json_annotation/json_annotation.dart';

part 'general_detail_model.g.dart';

@JsonSerializable()
class GeneralDetailModel {
  int id; // id
  String name; // 姓名
  String quality; // 星级
  String contory; // 阵营
  num cost; // cost
  String type; // 兵种
  int distance; // 攻击距离
  num attack; // 攻击
  num def; // 防御
  num ruse; // 谋略
  num speed; // 速度
  int methodId; // 主技能id
  String methodName; // 主技能名称
  int methodId1; // 可拆技能id
  String methodName1; // 可拆技能名称
  GeneralDetailModel(
    this.id,
    this.name,
    this.quality,
    this.contory,
    this.cost,
    this.type,
    this.distance,
    this.attack,
    this.def,
    this.ruse,
    this.speed,
    this.methodId,
    this.methodName,
    this.methodId1,
    this.methodName1
	);

  factory GeneralDetailModel.fromJson(Map<String, dynamic> json) =>
    _$GeneralDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralDetailModelToJson(this);

  GeneralDetailModel.empty();
}
