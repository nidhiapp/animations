import 'dart:math' show pi;

import 'package:flutter/material.dart';

class BlueContAnimation extends StatefulWidget {
  const BlueContAnimation({super.key});

  @override
  State<BlueContAnimation> createState() => _BlueContAnimationState();
}

class _BlueContAnimationState extends State<BlueContAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _animation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);
    
    _animationController.repeat();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateZ(_animation.value),
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Color.fromARGB(255, 112, 111, 111),
                          spreadRadius: 0.5,
                          blurRadius: 20),
                    ],
                    color: Colors.blue),
              ),
            );
          },
        ),
      ),
    );
  }
}
