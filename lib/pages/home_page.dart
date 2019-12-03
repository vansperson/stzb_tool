import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stzb_tool/models/squads/squads_model.dart';
import 'package:stzb_tool/redux/app_state.dart';
import 'package:stzb_tool/util/enum.dart';
import 'package:stzb_tool/widgets/squad_item_widget.dart';

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
              StoreConnector<AppState, SquadsModel>(
                converter: (Store<AppState> store) => store.state.squads,
                builder: (context, generalCast) {
                  return Column(
                    children: <Widget>[
                      SquadItemWidget(GeneralSiteEnum.camp, squadItem: generalCast.camp),
                      SquadItemWidget(GeneralSiteEnum.central, squadItem: generalCast.central),
                      SquadItemWidget(GeneralSiteEnum.forward, squadItem: generalCast.forward)
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