import 'package:flutter/material.dart';
import 'package:stzb_tool/routers/navigator_util.dart';
import 'package:stzb_tool/widgets/skip_down_time_progress.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  double offset = 22.0;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onSkipClick() {
    NavigatorUtil.goHomePage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            top: 0.0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'lib/assets/images/splash.jpg',
              scale: 2.0,
              fit: BoxFit.cover
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + offset,
            right: offset,
            child: SkipDownTimeProgress(
              color: Colors.orangeAccent,
              radius: offset,
              duration: Duration(milliseconds: 3000),
              size: Size(offset, offset),
              clickListenner: this,
            )
          )
        ],
      ),
    );
  }
}
