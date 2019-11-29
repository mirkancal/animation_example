import 'package:flutter/material.dart';

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation =
        Tween<double>(begin: 200.0, end: 400.0).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });

    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(
          colors: Colors.red,
        ),
      ),
    );
  }
}
