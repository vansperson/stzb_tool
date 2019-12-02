import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stzb_tool/models/filtrate/general_filtrate_model.dart';
import 'package:stzb_tool/models/filtrate/general_filtrate_option_model.dart';
import 'package:stzb_tool/redux/app_state.dart';
import 'package:stzb_tool/redux/squads_reducer.dart';
import 'dart:convert';

import 'package:stzb_tool/widgets/drop_select_widget.dart';
import 'package:stzb_tool/widgets/search_bar_widget.dart';
import 'package:stzb_tool/widgets/search_list_widget.dart';
import 'package:stzb_tool/util/filtrate.dart';

class SearchGeneralPage extends StatefulWidget {
  final int position;

  SearchGeneralPage({this.position});

  @override
  _SearchGeneralState createState() => _SearchGeneralState();
}

class _SearchGeneralState extends State<SearchGeneralPage> {
  bool _showSelectOptions = false;
  bool _showMask = false;
  double _maskTopPosition = 0.0;
  GeneralFiltrateModel _currentGeneral;
  String _keyWord = '';

  Map<String, dynamic> _filtrateData = {
    'quality': {'label': '星级', 'value': '' },
    'contory': {'label': '阵营', 'value': '' },
    'type': {'label': '兵种', 'value': '' },
    'cost': {'label': 'Cost', 'value': '' }
  };

  @override
  void initState() {
    print(widget.position);
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
                        setState(() {
                          _keyWord = keyword;
                        });
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
                    Offstage(
                      offstage: _keyWord.isNotEmpty,
                      child: Container(
                        height: 44.0,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: filtrategeneral.map((item) {
                            return Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if(!_showSelectOptions || (_currentGeneral?.key == item.key && _showSelectOptions)) {
                                      _showSelectOptions = !_showSelectOptions;
                                      _maskTopPosition = 99.0;
                                      _showMask = _showSelectOptions;
                                    }
                                    _currentGeneral = filtrategeneral.singleWhere((filtrate) => filtrate.key == item.key);
                                  });
                                },
                                child: DropSelectWidget(name: _filtrateData[item.key]['label'], hasDrop: false),
                              )
                            );
                          }).toList()
                        ),
                      )
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: FutureBuilder(
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container();
                            }
                            List<dynamic> generals = json.decode(snapshot.data.toString());
                            var filtrategeneral;
                            if(_keyWord.isNotEmpty) {
                              filtrategeneral = generals.where((item) { 
                                return item['name'].contains(_keyWord);
                              }).toList();
                            } else {
                              filtrategeneral = generals.where((item) {
                                return 
                                  (_filtrateData['quality']['value'].isEmpty || _filtrateData['quality']['value'] == item['quality']) &&
                                  (_filtrateData['contory']['value'].isEmpty || _filtrateData['contory']['value'] == item['contory']) &&
                                  (_filtrateData['type']['value'].isEmpty || _filtrateData['type']['value'] == item['type']) &&
                                  (_filtrateData['cost']['value'].isEmpty || _filtrateData['cost']['value'] == item['cost'].toString()) 
                                ;
                              }).toList();
                            }
                            if(filtrategeneral.isEmpty) {
                              return Container(
                                alignment: Alignment.center,
                                height: 34.0,
                                child: Text('没有符合条件的角色', style: TextStyle(
                                  color: Color(0xff131519),
                                  fontSize: 15.0
                                ))
                              );
                            } else {
                              return SearchListWidget(
                                list: filtrategeneral,
                                onSelect: (id) {
                                  StoreProvider.of<AppState>(context).dispatch(AddGeneral(id: id, position: widget.position));
                                }
                              );
                            }
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
              child: (_showMask && _keyWord.isEmpty) ? Container(
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
                child: SelectOptionsWidget(
                  options: _currentGeneral.options,
                  onChange: (GeneralFiltrateOptionModel option) {
                    setState(() {
                      _filtrateData[_currentGeneral.key]['value'] = option.value;
                      _filtrateData[_currentGeneral.key]['label'] = option.label;
                      _showSelectOptions = false;
                      _showMask = false;
                    });
                  }
                )
              ) : Container()
            ) 
          )
        ],
      )
    );
  }
}