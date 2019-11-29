import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchHeroPage extends StatefulWidget {
  @override
  _SearchHeroPageState createState() => _SearchHeroPageState();
}

class _SearchHeroPageState extends State<SearchHeroPage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animationOpacity;

  TextEditingController _controller;
  FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    _animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationOpacity = new Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _controller = new TextEditingController();
    _focusNode = new FocusNode();

    _focusNode.addListener(() {
      _hasFocus = _focusNode.hasFocus;
      if(_focusNode.hasFocus) {
        _animationController.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    _focusNode.dispose();
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
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            _animationController.reverse();
                            _focusNode.unfocus();
                          });
                        },
                        child: FadeTransition(
                          opacity: _animationOpacity,
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: 35.0,
                            child: Text('取消', style: TextStyle(
                              color: Color(0xff647686),
                              fontSize: 16.0
                            )),
                          )
                        )
                      ),
                      AnimatedContainer(
                        height: 35.0,
                        margin: EdgeInsets.only(right: _hasFocus ? 80.0 : 0),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xfff6f7f9)
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              width: 30.0,
                              child: Icon(CupertinoIcons.search, color: Color(0xffa6b2be))
                            ),
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                focusNode: _focusNode,
                                maxLines: 1,
                                cursorWidth: 1.0,
                                cursorColor: Color(0xffa6b2be),
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14.0
                                ),
                                decoration: InputDecoration(
                                  hintText: '搜索',
                                  contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                                  border: InputBorder.none
                                )
                              ),
                            ),
                            Offstage(
                              offstage: false,
                              child: Container(
                                alignment: Alignment.center,
                                width: 30.0,
                                child: Icon(CupertinoIcons.clear_circled_solid, color: Color(0xffa6b2be))
                              )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
          Expanded(
            child: Container(
              
            )
          )
        ],
      ),
    );
  }
}