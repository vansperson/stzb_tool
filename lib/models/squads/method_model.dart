import 'package:json_annotation/json_annotation.dart';

part 'method_model.g.dart';

@JsonSerializable()
class MethodModel {
  int methodId;
  String methodName;

  MethodModel(
    this.methodId,
    this.methodName
  );

  factory MethodModel.fromJson(Map<String, dynamic> json) => _$MethodModelFromJson(json);

  Map<String, dynamic> toJson() => _$MethodModelToJson(this);

  MethodModel.empty();
}
