import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stzb_tool/widgets/search_bar_widget.dart';

class SearchHeroPage extends StatefulWidget {
  @override
  _SearchHeroPageState createState() => _SearchHeroPageState();
}

class _SearchHeroPageState extends State<SearchHeroPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6edf1),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SearchBarWidget(
                  onChange: (String keyword) {
                    print(keyword);
                  },
                )
              ],
            )
          ),
          Expanded(
            child: Container(
              child: InkWell(),
            )
          )
        ],
      ),
    );
  }
}