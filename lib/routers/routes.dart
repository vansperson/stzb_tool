import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:stzb_tool/routers/route_handlers.dart';

class Routes {
  static String root = '/';
  static String home = '/home';
  static String searchHero = '/searchHero';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
        return Container();
      }
    );
    
    router.define(root, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(searchHero, handler: searchHeroHandle);
  }
}