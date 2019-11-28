import 'package:flutter/material.dart';
import 'package:stzb_tool/util/index.dart';

class HeroConfig extends StatefulWidget {
  @override
  _HeroConfigState createState() => _HeroConfigState();
}

class _HeroConfigState extends State<HeroConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11.25),
      margin: const EdgeInsets.only(bottom: 11.25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.75),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AddRole(),
          AddMethod(),
          AddMethod(),
          AddMethod()
        ],
      ),
    );
  }
}

class AddRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94.0,
      height: 147.0,
      decoration: BoxDecoration(
        color: Color(0xfff6f7f9),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          width: 0.5,
          color: Color(0xffccd7dd)
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 45.0,
            child: Text(
              '大营',
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xff1aa1f3)
              ),
            ),
          ),
          Container(
            width: 75.0,
            height: 75.0,
            alignment: Alignment.topCenter,
            child: _avatarImage()
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              true ? '王异' : '点击添加武将',
              style: TextStyle(
                fontSize: 12.0,
                color: true ? Color(0xff131519) : Color(0xffa6b2be)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _addImage() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      width: 28.0,
      height: 28.0,
      child: Image.asset('lib/assets/images/add.png'),
    );
  }

  Widget _avatarImage() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        PhysicalModel(
          color: Colors.transparent, 
          borderRadius: BorderRadius.circular(6.0),
          clipBehavior: Clip.antiAlias,
          child:  Container(
            width: 65.0,
            height: 65.0,
            child: Image.network(
              '${Utils.baseAvatarUrl}${100028}.jpg',
            ),
          )
        ),
        Positioned(
          top: -11.0,
          right: -11.0,
          child: Container(
            width: 22.0,
            height: 22.0,
            child: Image.asset('lib/assets/images/delete.png')
          )
        )
      ],
    );
  }
}

class AddMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 65.0,
            height: 65.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(65.0),
              border: Border.all(
                width: 1.0,
                color: Color(0xffccd7dd)
              )
            ),
            child: _skillImage()
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              '战法一',
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xffa6b2be)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _addImage() {
    return Container(
      width: 28.0,
      height: 28.0,
      child: Image.asset('lib/assets/images/add.png'),
    );
  }

  Widget _skillImage() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        PhysicalModel(
          color: Colors.transparent, 
          borderRadius: BorderRadius.circular(65.0),
          clipBehavior: Clip.antiAlias,
          child:  Container(
            width: 65.0,
            height: 65.0,
            child: Image.network(
              '${Utils.baseSkillUrl}02.png',
            ),
          )
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 22.0,
            height: 22.0,
            child: Image.asset('lib/assets/images/delete.png')
          )
        )
      ],
    );
  }
}