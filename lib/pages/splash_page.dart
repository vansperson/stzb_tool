import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stzb_tool/models/filtrate/general_filtrate_model.dart';
import 'package:stzb_tool/models/general/general_detail_model.dart';
import 'package:stzb_tool/models/general/method_item_model.dart';
import 'package:stzb_tool/routers/navigator_util.dart';
import 'package:stzb_tool/util/global.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  double offset = 22.0;
  int _assets = 1;
  int _loadAssets = 0;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() async {
    rootBundle.loadString('lib/assets/utf8/g10_all_chinese.json').then((value) {
      if(value.isNotEmpty) {
        GlobalInfo.generals = (json.decode(value) as List)?.map((f) =>
          f == null ? null : GeneralDetailModel.fromJson(f as Map<String, dynamic>)
        )?.toList();
        _checkLoadAssets();
      }
    });

    rootBundle.loadString('lib/assets/utf8/jineng_list_chinese.json').then((value) {
      if(value.isNotEmpty) {
        GlobalInfo.methodItemList = (json.decode(value) as List)?.map((f) =>
          f == null ? null : MethodItemModel.fromJson(f as Map<String, dynamic>)
        )?.toList();
        _checkLoadAssets();
      }
    });

    rootBundle.loadString('lib/assets/filtrate/general.json').then((value) {
      if(value.isNotEmpty) {
        GlobalInfo.generalFiltrate = (json.decode(value) as List)?.map((f) =>
          f == null ? null : GeneralFiltrateModel.fromJson(f as Map<String, dynamic>)
        )?.toList();
        _checkLoadAssets();
      }
    });
  }

  _checkLoadAssets() {
    _loadAssets += 1;
    if(_loadAssets == _assets) {
      NavigatorUtil.goHomePage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            top: 0.0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'lib/assets/images/splash.jpg',
              scale: 2.0,
              fit: BoxFit.cover
            ),
          )
        ],
      ),
    );
  }
}
