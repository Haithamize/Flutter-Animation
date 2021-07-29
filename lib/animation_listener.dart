import 'package:flutter/material.dart';

class AnimationListener extends StatefulWidget {
  const AnimationListener({Key? key}) : super(key: key);

  @override
  _AnimationListenerState createState() => _AnimationListenerState();
}

class _AnimationListenerState extends State<AnimationListener> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 5000), vsync: this);

    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    animation = Tween(begin: 50.0, end: 300.0).animate(curvedAnimation);
    // animation.addListener(() {
    //   setState(() {
    //     //do something when the state of animation is changed w h3ml set state b2a
    //     //el listener hy5leni msln 3nd sequence mo3ayan msln 200 a2dr a3ml haga mo3ayana lma el animation ywsl lel rakam da
    //   });
    // });
    animation.addStatusListener(listener);
    controller.forward();
  }

  void listener(AnimationStatus status){
    if(status == AnimationStatus.completed){
      controller.reverse();
    }else if (status == AnimationStatus.dismissed){
      controller.forward();
    }
  }

  Widget builder(BuildContext context, Widget? child){
    return Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(builder: builder, animation: animation,),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
}
