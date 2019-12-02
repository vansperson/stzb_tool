import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:stzb_tool/pages/home_page.dart';
import 'package:stzb_tool/pages/search_general_page.dart';
import 'package:stzb_tool/pages/splash_page.dart';
import 'package:stzb_tool/routers/convert_util.dart';

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

var searchgeneralHandle = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String position = params['position']?.first;
    return new SearchGeneralPage(
      position: ConvertUtils.string2int(position)
    );
  }
);