import 'package:animation_practice/animated_logo_class.dart';
import 'package:flutter/material.dart';

class AnimatedWidgetPractice extends StatefulWidget {
  const AnimatedWidgetPractice({Key? key}) : super(key: key);


  @override
  _AnimatedWidgetPracticeState createState() => _AnimatedWidgetPracticeState();
}

class _AnimatedWidgetPracticeState extends State<AnimatedWidgetPractice> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn); //hna lazm a3ml el animation bl shakl da l2en lw 3mlt CurvedAnimation var lwhdo w edeto el controller ka parent w kda kan bytl3 error

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(32.0),
          child: AnimatedLogo(animation: animation,)
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
}
