import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:stzb_tool/app.dart';
import 'package:stzb_tool/redux/store.dart';
import 'package:stzb_tool/routers/application.dart';
import 'package:stzb_tool/routers/routes.dart';


void main() async {
  final store = await createReduxStore();
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
 
  runApp(App(store));
}
