import 'package:flutter/material.dart';
class TitleAnimation extends StatelessWidget {
  const TitleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(tween:Tween<double>(begin: 0, end: 1) ,
    child:Text("Travel Tie",style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                    color: Colors.white),) ,
    duration:Duration(seconds: 1) ,
    builder: (context, val,  child) {
       return Opacity(opacity: val,
       child: Padding(padding: EdgeInsets.only(top: val*40),
       child: child,
       ),
       ) ;
    },
  );
  }
}