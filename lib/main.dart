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
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);

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
      child: AnimatedLogo(animation: animation),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({this.animation}) : super(listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0.0, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 200.0, end: 400.0);

  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: FlutterLogo(),
      ),
    );
  }
}

// class HeartbeatEffect extends StatelessWidget {
//   HeartbeatEffect({this.animation, this.child});
//   final Animation animation;
//   final Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation,
//       child: child,
//       builder: (context, child) => Container(
//         height: animation.value,
//         width: animation.value,
//         child: child,
//       ),
//     );
//   }
// }

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
