import 'package:flutter/material.dart';
import 'package:stzb_tool/routers/application.dart';
import 'package:stzb_tool/routers/routes.dart';

class NavigatorUtil {
  static void goBack(BuildContext context) {
    Application.router.pop(context);
  }

  /// 带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  /// 跳转到主页面
  static void goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routes.home, replace: true);
  }
}