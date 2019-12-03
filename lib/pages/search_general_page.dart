import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stzb_tool/models/general/general_detail_model.dart';
import 'package:stzb_tool/redux/app_state.dart';
import 'package:stzb_tool/redux/squads_reducer.dart';

import 'package:stzb_tool/models/filtrate/general_filtrate_model.dart';
import 'package:stzb_tool/models/filtrate/general_filtrate_option_model.dart';
import 'package:stzb_tool/routers/navigator_util.dart';
import 'package:stzb_tool/util/global.dart';

import 'package:stzb_tool/widgets/drop_select_widget.dart';
import 'package:stzb_tool/widgets/search_bar_widget.dart';
import 'package:stzb_tool/widgets/search_list_widget.dart';

class SearchGeneralPage extends StatefulWidget {
  final int site;

  SearchGeneralPage({this.site});

  @override
  _SearchGeneralState createState() => _SearchGeneralState();
}

class _SearchGeneralState extends State<SearchGeneralPage> {
  double _maskTopSite = 0.0;
  bool _showSelectOptions = false;
  bool _showMask = false;

  GeneralFiltrateModel _currentGeneral;
  String _keyWord = '';

  String _quality = '';
  String _contory = '';
  String _type = '';
  String _cost = '';

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
                        setState(() {
                          _keyWord = keyword;
                        });
                      },
                      listenFocus: (bool focus) {
                        setState(() {
                          _maskTopSite = 55.0;
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
                          children: GlobalInfo.generalFiltrate.map((item) {
                            return Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if(!_showSelectOptions || (_currentGeneral?.key == item.key && _showSelectOptions)) {
                                      _showSelectOptions = !_showSelectOptions;
                                      _maskTopSite = 99.0;
                                      _showMask = _showSelectOptions;
                                    }
                                    _currentGeneral = item;
                                  });
                                },
                                child: DropSelectWidget(
                                  name: _getLabel(item), 
                                  hasDrop: _currentGeneral?.key == item.key && _showSelectOptions
                                ),
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
                        child: _renderResult()
                      )
                    )
                  ],
                )
              )
            ],
          ),
          Positioned(
            top: _maskTopSite + MediaQuery.of(context).padding.top,
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
                  onSelect: _selectOption
                )
              ) : Container()
            ) 
          )
        ],
      )
    );
  }

  Widget _renderResult() {
    List<GeneralDetailModel> result = new List();
    if(_keyWord.isNotEmpty) {
      result.addAll(GlobalInfo.generals.where((f) => f.name.contains(_keyWord)).toList());
    } else {
      result.addAll(GlobalInfo.generals.where((f) => (
        (_quality.isEmpty || f.quality == _quality) && 
        (_contory.isEmpty || f.contory == _contory) && 
        (_type.isEmpty || f.type == _type) && 
        (_cost.isEmpty || f.cost.toString() == _cost)
      )).toList());
    }

    return result.isEmpty ? Container(
      alignment: Alignment.center,
      height: 34.0,
      child: Text('没有符合条件的角色', style: TextStyle(color: Color(0xff131519), fontSize: 15.0))
    ) : SearchListWidget(
      list: result,
      onSelect: (general) {
        StoreProvider.of<AppState>(context).dispatch(AddGeneral(general: general, site: widget.site));
        NavigatorUtil.goBack(context);
      }
    );
  }

  String _getLabel(GeneralFiltrateModel item) {
    switch(item.key) {
      case 'quality':
        return _quality.isEmpty ? item.label : item.options.singleWhere((f) => f.value == _quality).label;
      case 'contory':
        return _contory.isEmpty ? item.label : item.options.singleWhere((f) => f.value == _contory).label;
      case 'type':
        return _type.isEmpty ? item.label : item.options.singleWhere((f) => f.value == _type).label;
      case 'cost':
        return _cost.isEmpty ? item.label : item.options.singleWhere((f) => f.value == _cost).label;
      default:
        return item.label;
    }
  }

  void _selectOption(GeneralFiltrateOptionModel option) {
    setState(() {
      _showSelectOptions = false;
      _showMask = false;
      switch(_currentGeneral.key) {
        case 'quality':
          _quality = option.value;
          break;
        case 'contory':
          _contory = option.value;
          break;
        case 'type':
          _type = option.value;
          break;
        case 'cost':
          _cost = option.value;
          break;
      }
    });
  }
}