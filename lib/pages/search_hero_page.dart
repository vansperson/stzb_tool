import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:stzb_tool/widgets/drop_select_widget.dart';
import 'package:stzb_tool/widgets/search_bar_widget.dart';
import 'package:stzb_tool/widgets/search_list_widget.dart';

class SearchHeroPage extends StatefulWidget {
  @override
  _SearchHeroPageState createState() => _SearchHeroPageState();
}

class _SearchHeroPageState extends State<SearchHeroPage> {
  bool _showSelectOptions = false;
  bool _showMask = false;
  double _maskTopPosition = 0.0;

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
      body: Stack(
        children: <Widget>[
          Column(
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
                      listenFocus: (bool focus) {
                        setState(() {
                          _maskTopPosition = 55.0;
                          _showMask = focus;
                          _showSelectOptions = false;
                        });
                      },
                    )
                  ],
                )
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: 44.0,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _showSelectOptions = !_showSelectOptions;
                                  _maskTopPosition = 99.0;
                                  _showMask = _showSelectOptions;
                                });
                              },
                              child: DropSelectWidget(name: '星级', hasDrop: false),
                            )
                          ),
                          Expanded(
                            child: InkWell(
                              child: DropSelectWidget(name: '阵营', hasDrop: false),
                            )
                          ),
                          Expanded(
                            child: InkWell(
                              child: DropSelectWidget(name: '兵种', hasDrop: false),
                            )
                          ),
                          Expanded(
                            child: InkWell(
                              child: DropSelectWidget(name: 'Cost', hasDrop: false),
                            )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: FutureBuilder(
                          future: DefaultAssetBundle.of(context).loadString('lib/assets/utf8/g10_all_chinese.json'),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container();
                            }
                            List<dynamic> heros = json.decode(snapshot.data.toString());
                            // return SearchListWidget(list: heros);
                            return Container();
                          },
                        )
                      )
                    )
                  ],
                )
              )
            ],
          ),
          Positioned(
            top: _maskTopPosition + MediaQuery.of(context).padding.top,
            left: 0.0, right: 0.0,
            child: AnimatedOpacity(
              opacity: _showMask  ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: _showMask ? Container(
                height: MediaQuery.of(context).size.height - (45.0 + MediaQuery.of(context).padding.top),
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ) : Container()
            )
          ),
          Positioned(
            top: 99.0 + MediaQuery.of(context).padding.top,
            left: 0.0, right: 0.0,
            child: AnimatedOpacity(
              opacity: _showSelectOptions ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: _showSelectOptions ? Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      width: 1.0,
                      color: Color(0xffccd7dd)
                    )
                  )
                ),
                child: SelectOptionsWidget()
              ) : Container()
            ) 
          )
        ],
      )
    );
  }
}