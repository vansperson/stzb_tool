import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:stzb_tool/pages/my_app.dart';
import 'package:stzb_tool/routers/application.dart';
import 'package:stzb_tool/routers/routes.dart';


void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
 
  runApp(MyApp());
}
