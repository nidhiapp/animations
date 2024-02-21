import 'dart:math' show pi;
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:flutter/material.dart';

class ThreeDAnimations extends StatefulWidget {
  const ThreeDAnimations({super.key});

  @override
  State<ThreeDAnimations> createState() => _ThreeDAnimationsState();
}

class _ThreeDAnimationsState extends State<ThreeDAnimations>
    with TickerProviderStateMixin {
  late AnimationController _xCont;
  late AnimationController _yCont;
  late AnimationController _zCont;
  late Tween<double> _animation;
  @override
  void initState() {
    _xCont = AnimationController(vsync: this, duration: Duration(seconds: 5));
    _yCont = AnimationController(vsync: this, duration: Duration(seconds: 10));
    _zCont = AnimationController(vsync: this, duration: Duration(seconds: 40));
    _animation = Tween<double>(begin: 0, end: pi * 2);
    // TODO: implement initState
    super.initState();
  }

  double widthAndHeight = 100.0;
  @override
  Widget build(BuildContext context) {
    _xCont
      ..reset()
      ..repeat();
    _yCont
      ..reset()
     ..repeat();
    _zCont
      ..reset()
      ..repeat();
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([_xCont, _yCont, _zCont]),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
              ..rotateX(_animation.evaluate(_xCont))
              ..rotateY(_animation.evaluate(_yCont))
              ..rotateZ(_animation.evaluate(_zCont)),
              child: Stack(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..translate(Vector3(0,0,-widthAndHeight)),
                    child: Container(
                      height: widthAndHeight,
                      width: widthAndHeight,
                      color: Colors.amber,
                    ),
                  ),
                   Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()..rotateY(pi/2),
                     child: Container(
                      height: widthAndHeight,
                      width: widthAndHeight,
                      color: Colors.black,
                                       ),
                   ),
                   Transform(
                    transform: Matrix4.identity()..rotateY(-(pi/2.0)),
                    alignment: Alignment.centerRight,
                     child: Container(
                      height: widthAndHeight,
                      width: widthAndHeight,
                      color: Colors.green,
                                       ),
                   ),
                    Container(
                    height: widthAndHeight,
                    width: widthAndHeight,
                    color: Colors.blue,
                  ),
                    Transform(
                      alignment: Alignment.topCenter,
                      transform: Matrix4.identity()..rotateX(-pi/2.0),
                      child: Container(
                      height: widthAndHeight,
                      width: widthAndHeight,
                      color: Colors.purple,
                                        ),
                    ),
                  
                   Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()..rotateX((pi/2.0)),
                     child: Container(
                      height: widthAndHeight,
                      width: widthAndHeight,
                      color: Colors.pink,
                                       ),
                   ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
