import 'package:flutter/material.dart';
import 'package:stzb_tool/routers/application.dart';
import 'package:stzb_tool/routers/routes.dart';
import 'package:stzb_tool/util/enum.dart';

class NavigatorUtil {
  static void goPage(BuildContext context, String route) {
    Application.router.navigateTo(context, route);
  }

  /// 返回
  static void goBack(BuildContext context) {
    Application.router.pop(context);
  }

  /// 跳转到主页面
  static void goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routes.home, replace: true);
  }

  /// 跳转到武将选择页
  static void goGeneralSelectPage(BuildContext context, GeneralSiteEnum generalSite ) {
    Application.router.navigateTo(context, '${Routes.searchgeneral}?site=${generalSite.index}');
  }
}