import 'package:flutter/material.dart';
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
              HeroConfig(),
              HeroConfig(),
              HeroConfig(),
            ],
          ),
        )
      ),
    );
  }
}