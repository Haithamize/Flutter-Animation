import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({Key? key}) : super(key: key);


  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 5000), vsync: this);
    animation = Tween(begin: 0.0, end: 350.0).animate(controller);
    animation.addListener(() {
      setState(() {
        //do something when the state of animation is changed w h3ml set state b2a
        //el listener hy5leni msln 3nd sequence mo3ayan msln 200 a2dr a3ml haga mo3ayana lma el animation ywsl lel rakam da
      });
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
      body: Container(
          width: animation.value,
          height: animation.value,
          child: const FlutterLogo(size: 300,)),
    );
  }
}
