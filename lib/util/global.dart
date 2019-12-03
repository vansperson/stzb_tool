import 'package:stzb_tool/models/filtrate/general_filtrate_model.dart';
import 'package:stzb_tool/models/general/general_detail_model.dart';
import 'package:stzb_tool/models/general/method_item_model.dart';

/// 全局变量类
class GlobalInfo {
  /// 全武将列表
  static List<GeneralDetailModel> generals;
  /// 武将筛选
  static List<GeneralFiltrateModel> generalFiltrate;
  /// 技能列表
  static List<MethodItemModel> methodItemList;
}