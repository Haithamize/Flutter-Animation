import 'package:flutter/material.dart';

class BuilderAnimation extends StatefulWidget {
  const BuilderAnimation({Key? key}) : super(key: key);


  @override
  _BuilderAnimationState createState() => _BuilderAnimationState();
}

class _BuilderAnimationState extends State<BuilderAnimation> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 5000), vsync: this);

    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    animation = Tween(begin: 0.0, end: 200.0).animate(curvedAnimation);
    animation.addListener(() {
      setState(() {
        //do something when the state of animation is changed w h3ml set state b2a
        //el listener hy5leni msln 3nd sequence mo3ayan msln 200 a2dr a3ml haga mo3ayana lma el animation ywsl lel rakam da
      });
    });
    controller.forward();
  }

  Widget builder(BuildContext context, Widget? child){
    return Container(
        width: animation.value,
        height: animation.value,
        child: const FlutterLogo(),
    );
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
      body: Center(child: AnimatedBuilder(animation: animation,builder: builder,),)
    );
  }
}
