import 'package:flutter/material.dart';
import 'dart:math' show pi;

enum CircleSide {left,right }

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;
    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);

        offset = Offset(size.width, size.height);
        clockwise = false;
        break;

      case CircleSide.right:
        path.moveTo(0, 0);
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockwise);
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  HalfCircleClipper({super.reclip, required this.side});
  @override
  getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class TwoHalfCircles extends StatefulWidget {
  const TwoHalfCircles({super.key});

  @override
  State<TwoHalfCircles> createState() => _TwoHalfCirclesState();
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}

class _TwoHalfCirclesState extends State<TwoHalfCircles>
    with TickerProviderStateMixin {
  late AnimationController _flipAnimationController;
  late Animation _flipAnimation;
  late Animation<double> _aniClockWiseAnimation;
  late AnimationController _aniclockwiseAnimationController;
  @override
  void initState() {
    _aniclockwiseAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _aniClockWiseAnimation = Tween<double>(begin: 0, end: -(pi / 2)).animate(
        CurvedAnimation(
            parent: _aniclockwiseAnimationController, curve: Curves.bounceOut));
    _flipAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(CurvedAnimation(
        parent: _flipAnimationController, curve: Curves.bounceOut));
    //  _aniclockwiseAnimationController.repeat();
    // TODO: implement initState

    //status listener
    _aniclockwiseAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
                begin: _flipAnimation.value, end: _flipAnimation.value + pi)
            .animate(CurvedAnimation(
                parent: _flipAnimationController, curve: Curves.bounceOut));

        _flipAnimationController..reset()..forward();
        //  _flipAnimationController.forward();
      }
    });

    _flipAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
                begin: _flipAnimation.value,
                end: _flipAnimation.value + -(pi / 2.0))
            .animate(CurvedAnimation(
                parent: _aniclockwiseAnimationController,
                curve: Curves.bounceOut));
        _aniclockwiseAnimationController
          ..reset()
          ..forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _flipAnimationController.dispose();
    _aniclockwiseAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _aniclockwiseAnimationController
      ..reset()
      ..forward.delayed(Duration(seconds: 1));

    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _aniclockwiseAnimationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_aniclockwiseAnimationController.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _flipAnimationController,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()
                          ..rotateY(_flipAnimation.value),
                        child: ClipPath(
                          clipper: HalfCircleClipper(side: CircleSide.left),
                          child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _flipAnimation,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()
                          ..rotateY(_flipAnimation.value),
                        child: ClipPath(
                          clipper: HalfCircleClipper(side: CircleSide.right),
                          child: Container(
                            height: 200,
                            width: 200,
                            color: const Color.fromARGB(255, 12, 53, 87),
                          ),
                        ),
                      );
                    },
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
