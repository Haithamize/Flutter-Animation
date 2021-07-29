import 'package:flutter/cupertino.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  static final rotationTween = Tween<double>(begin: 0.0, end: 12.0);
  static final opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final sizeTween = Tween<double>(begin: 0.0, end: 300.0);


  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Center(
      child: Transform.rotate(
        angle: rotationTween.evaluate(animation),
        child: Opacity(
          opacity: opacityTween.evaluate(animation),
          child: Container(
            child: const FlutterLogo(),
            width: sizeTween.evaluate(animation),
            height: sizeTween.evaluate(animation),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
          ),
        ),
      ),
    );
  }
}
