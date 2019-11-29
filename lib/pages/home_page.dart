import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stzb_tool/models/cast/hero_cast_model.dart';
import 'package:stzb_tool/redux/app_state.dart';
import 'package:stzb_tool/util/enum.dart';
import 'package:stzb_tool/widgets/hero_config_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6edf1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(11.25),
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: <Widget>[
              StoreConnector<AppState, HeroCastModel>(
                converter: (Store<AppState> store) => store.state.heroCast,
                builder: (context, heroCast) {
                  return Column(
                    children: <Widget>[
                      HeroConfigWiget(HeroPositionEnum.camp, heroConfig: heroCast.camp),
                      HeroConfigWiget(HeroPositionEnum.central, heroConfig: heroCast.central),
                      HeroConfigWiget(HeroPositionEnum.forward, heroConfig: heroCast.forward)
                    ],
                  );
                }
              )
            ],
          ),
        )
      ),
    );
  }
}