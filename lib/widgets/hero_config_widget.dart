import 'package:flutter/material.dart';
import 'package:stzb_tool/models/cast/hero_config_model.dart';
import 'package:stzb_tool/models/cast/hero_skills_model.dart';
import 'package:stzb_tool/routers/navigator_util.dart';
import 'package:stzb_tool/util/enum.dart';
import 'package:stzb_tool/util/index.dart';

class HeroConfigWiget extends StatefulWidget {
  final HeroPositionEnum heroPosition;
  final HeroConfigModel heroConfig;

  HeroConfigWiget(this.heroPosition, {this.heroConfig});

  @override
  _HeroConfigWigetState createState() => _HeroConfigWigetState();
}

class _HeroConfigWigetState extends State<HeroConfigWiget> {
  List<String> _positionDesc = ['大营', '中军', '前锋'];
  
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
          _renderHero(),
          AddMethodWiget(SkillPositonEnum.masterSkill, heroSkill: widget.heroConfig?.masterSkill),
          AddMethodWiget(SkillPositonEnum.secondSkill, heroSkill: widget.heroConfig?.secondSkill),
          AddMethodWiget(SkillPositonEnum.thirdlySkill, heroSkill: widget.heroConfig?.thirdlySkill)
        ],
      ),
    );
  }

  Widget _renderHero() {
    return Container(
      width: 94.0,
      height: 147.0,
      decoration: BoxDecoration(
        color: Color(0xfff6f7f9),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(width: 0.5, color: Color(0xffccd7dd)),
      ),
      child: InkWell(
        onTap: () {
          if(widget.heroConfig == null) {
            NavigatorUtil.goPage(context, '/searchHero');
          } else {
            print('查看详情');
          }
        },
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 45.0,
              child: Text(
                _positionDesc[widget.heroPosition.index],
                style: TextStyle(fontSize: 15.0, color: Color(0xff1aa1f3)),
              ),
            ),
            Container(
              width: 75.0,
              height: 75.0,
              alignment: Alignment.topCenter,
              child: widget.heroConfig == null ? Container(
                margin: const EdgeInsets.only(top: 10.0),
                width: 28.0,
                height: 28.0,
                child: Image.asset('lib/assets/images/add.png'),
              ) : Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  PhysicalModel(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(6.0),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: 65.0,
                      height: 65.0,
                      child: Image.network(
                        '${Utils.baseAvatarUrl}${widget.heroConfig.avatarId}.jpg',
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
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                widget.heroConfig == null ? '点击添加武将' : widget.heroConfig.name,
                style: TextStyle(
                  fontSize: 12.0,
                  color: widget.heroConfig == null ? Color(0xffa6b2be) : Color(0xff131519)
                ),
              ),
            )
          ],
        )
      ) 
    );
  }
}

class AddMethodWiget extends StatelessWidget {
  final SkillPositonEnum skillPosition;
  final HeroSkillsModel heroSkill;
  AddMethodWiget(this.skillPosition, {this.heroSkill});
  
  @override
  Widget build(BuildContext context) {
    List<String> _postionDesc = ['战法一', '战法二', '战法三'];
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
                border: Border.all(width: 1.0, color: Color(0xffccd7dd)
              )
            ),
            child: heroSkill == null ? Container(
              width: 28.0,
              height: 28.0,
              child: Image.asset('lib/assets/images/add.png'),
            ) : Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                PhysicalModel(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(65.0),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: 65.0,
                    height: 65.0,
                    child: Image.network(
                      '${Utils.baseSkillUrl}${heroSkill.skillId}.png',
                    )
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
              ]
            )
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              heroSkill == null ? _postionDesc[skillPosition.index] : heroSkill.name,
              style: TextStyle(fontSize: 12.0, color: Color(0xffa6b2be)),
            ),
          )
        ],
      ),
    );
  }
}
