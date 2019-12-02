import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final void Function(String keyword) onChange;
  final void Function(bool hasFocus) listenFocus;

  SearchBarWidget({
    Key key,
    @required this.onChange,
    this.listenFocus
  });

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animationOpacity;

  TextEditingController _controller;
  FocusNode _focusNode;
  bool _hasFocus = false;
  String _keyword = '';
  
  @override
  void initState() {
    _animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationOpacity = new Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _controller = new TextEditingController();
    _focusNode = new FocusNode();

    _focusNode.addListener(() {
      _hasFocus = _focusNode.hasFocus;
      if(_hasFocus) {
        _animationController.forward();
      }
      if(widget.listenFocus != null) {
        widget.listenFocus(_hasFocus);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.unfocus();

    _animationController.dispose();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            duration: Duration(milliseconds: 300),
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
                    onChanged: (v) {
                      setState(() {
                        _keyword = v;
                        widget.onChange(_keyword);
                      });
                    },
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
                  offstage: _keyword.isEmpty,
                  child: InkWell(
                    onTap: () {
                      _controller.clear();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 30.0,
                      child: Icon(CupertinoIcons.clear_circled_solid, color: Color(0xffa6b2be))
                    )
                  ) 
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}