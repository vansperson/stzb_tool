import 'package:json_annotation/json_annotation.dart';

part 'method_item_model.g.dart';

@JsonSerializable()
class MethodItemModel {
  int id;
  String name;
  String type;

  MethodItemModel(
    this.id,
    this.name,
    this.type
  );

  factory MethodItemModel.fromJson(Map<String, dynamic> json) =>
    _$MethodItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MethodItemModelToJson(this);

  MethodItemModel.empty();
}