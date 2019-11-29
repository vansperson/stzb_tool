import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stzb_tool/models/app_state.dart';
import 'package:stzb_tool/models/hero_item_model.dart';
import 'package:stzb_tool/redux/actions.dart';
import 'package:stzb_tool/widgets/homePage/hero_config.dart';

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
              StoreConnector<AppState, int>(
                converter: (Store<AppState> store) => store.state.count,
                builder: (context, count) {
                  return Text('$count', style: TextStyle(fontSize: 24));
                }
              ),
              StoreConnector<AppState, VoidCallback>(
                converter: (Store<AppState> store) {
                  return () => store.dispatch(AddCount(2));
                },
                builder: (context, callback) {
                  return InkWell(
                    onTap: callback,
                    child: Text('点击'),
                  );
                },
              )
              // HeroConfig(),
              // HeroConfig(),
              // HeroConfig(),
              // Text('1')
            ],
          ),
        )
      ),
    );
  }
}