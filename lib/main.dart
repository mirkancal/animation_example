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

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      }
    });

    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HeartbeatEffect(
        animation: animation,
        child: FlutterLogo(),
      ),
    );
  }
}

class HeartbeatEffect extends StatelessWidget {
  HeartbeatEffect({this.animation, this.child});
  final Animation animation;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
    );
  }
}

// class AnimatedLogo extends AnimatedWidget {
//   const AnimatedLogo({
//     Key key,
//     @required this.animation,
//   }) : super(listenable: animation);

//   final Animation animation;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: animation.value,
//       width: animation.value,
//       child: FlutterLogo(
//         colors: Colors.red,
//       ),
//     );
//   }
// }
