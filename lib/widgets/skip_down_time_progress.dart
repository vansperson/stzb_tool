import 'package:flutter/material.dart';
import 'dart:math' as math;

class SkipDownTimeProgress extends StatefulWidget {
  final Color color;
  final double radius;
  final Duration duration;
  final Size size;
  final String skipText;

  final clickListenner;

  SkipDownTimeProgress(
    {
      Key key,
      this.color, 
      this.radius,
      this.duration,
      this.size,
      this.skipText = '跳过',
      this.clickListenner
    }
  ) : super(key: key);

  @override
  _SkipDownTimeProgressState createState() => _SkipDownTimeProgressState();
}

class _SkipDownTimeProgressState extends State<SkipDownTimeProgress> with TickerProviderStateMixin {
  AnimationController _animationController;
  double curAngle = 360.0;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: widget.duration);
    _animationController.addListener(_change);
    _animationController.addStatusListener((status){
      if(status == AnimationStatus.completed) {
        _onSkipClick();
      }
    });
    _doAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(SkipDownTimeProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _change() {
    double ange = double.parse(((_animationController.value * 360) ~/ 1).toString());
    setState(() {
      curAngle = (360.0 - ange);
    });
  }

  void _doAnimation() async {
    Future.delayed(Duration(milliseconds: 500), () {
      if(mounted) {
        _animationController.forward().orCancel;
      } else {
        _doAnimation();
      }
    });
  }

  void _onSkipClick() {
    if((_animationController.isAnimating || _animationController.isCompleted) && widget.clickListenner != null) {
      _animationController.stop();
      widget.clickListenner.onSkipClick();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSkipClick,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            painter: _DrawProgress(
              color: widget.color,
              radius: widget.radius,
              angle: curAngle
            ),
            size: widget.size,
          ),
          Text(
            widget.skipText,
            style: TextStyle(
              color: widget.color,
              fontSize: 12.0,
              decoration: TextDecoration.none
            ),
          )
        ],
      ),
    );
  }
}

class _DrawProgress extends CustomPainter {
  final Color color;
  final double radius;
  final AnimationController animationController;
  final double strokeWidth = 2.2;
  double angle;
  
  Paint circleFillPaint;
  Paint progressPaint;
  Rect rect;

  _DrawProgress({
    Key key,
    this.color,
    this.radius,
    this.angle,
    this.animationController
  }) {
    circleFillPaint = new Paint();
    circleFillPaint.color = Colors.white;
    circleFillPaint.style = PaintingStyle.fill;

    progressPaint = new Paint();
    progressPaint.color = color;
    progressPaint.style = PaintingStyle.stroke;
    progressPaint.strokeCap = StrokeCap.round;
    progressPaint.strokeWidth = strokeWidth;

    if(animationController != null && !animationController.isAnimating) {
      animationController.forward();
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width / 2;
    double y = size.height /2;
    Offset center = new Offset(x, y);

    canvas.drawCircle(center, radius - strokeWidth / 2, circleFillPaint);
    rect = Rect.fromCircle(center: center, radius: radius);
    angle = angle * (-1);
    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi * angle / 180;
    Path path = new Path();
    path.arcTo(rect, startAngle, sweepAngle, true);
    canvas.drawPath(path, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}