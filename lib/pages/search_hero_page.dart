import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stzb_tool/util/index.dart';
import 'dart:convert';
import 'package:stzb_tool/widgets/drop_select_widget.dart';
import 'package:stzb_tool/widgets/search_bar_widget.dart';

class SearchHeroPage extends StatefulWidget {
  @override
  _SearchHeroPageState createState() => _SearchHeroPageState();
}

class _SearchHeroPageState extends State<SearchHeroPage> {
  bool _showSelectOptions = false;


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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
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
                    Positioned(
                      top: 44.0,
                      left: 0.0,
                      width: MediaQuery.of(context).size.width,
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
                  ],
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
                        return GridView.builder(
                          padding: const EdgeInsets.all(12.0),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.75
                          ),
                          itemCount: heros.length,
                          itemBuilder: (BuildContext context, int index) {
                            var heroItem = heros[index];
                            return SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        child: PhysicalModel(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(6.0),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.network('${Utils.baseAvatarUrl}${heroItem['id']}.jpg'),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0.0,
                                        right: 0.0,
                                        bottom: 0.0,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Color.fromRGBO(0, 0, 0, 0.7),
                                          height: 28.0,
                                          child: Text(heroItem['name'], style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white
                                          ))
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30.0,
                                    width: 85.0,
                                    margin: const EdgeInsets.only(top: 15.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.5, color: Color(0xff3fa1f7)),
                                      borderRadius: BorderRadius.circular(15.0)
                                    ),
                                    child: Text('选择', style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xff1aa1f3)
                                    )),
                                  )
                                ],
                              )
                            );
                          }
                        );
                      },
                    )
                  )
                )
              ],
            )
          )
        ],
      ),
    );
  }
}