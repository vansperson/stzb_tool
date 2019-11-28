import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:stzb_tool/pages/home_page.dart';
import 'package:stzb_tool/pages/splash_page.dart';

/// 启动页
var splashHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new SplashPage();
  }
);

/// 首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  }
);