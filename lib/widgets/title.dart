import 'package:flutter/material.dart';
class TitleAnimation extends StatelessWidget {
  const TitleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(tween: ,
    duration:Duration(seconds: 1) ,
    builder: (context, value, child) {
       return Text("Travel Tie");
    },
  );
  }
}