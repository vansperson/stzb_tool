import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stzb_tool/redux/app_state.dart';
import 'package:stzb_tool/routers/application.dart';

class App extends StatelessWidget {
  final Store<AppState> store;
  App(this.store);
  
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: '率土之滨助手',
        theme: ThemeData(
          primaryColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
      )
    );
  }
}
