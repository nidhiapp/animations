import 'package:flutter/material.dart';

class AnimationControllerPrac extends StatefulWidget {
  const AnimationControllerPrac({super.key});

  @override
  State<AnimationControllerPrac> createState() =>
      _AnimationControllerPracState();
}

class _AnimationControllerPracState extends State<AnimationControllerPrac>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;
 late Animation<double?> _sizeAnimation;
  bool isFav = false;
  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(microseconds: 1), vsync: this);
    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red) .animate(_animationController);
    _sizeAnimation=Tween<double>(begin:30.0, end: 40).animate(_animationController);

    _animationController.addListener(() {
      print("value od aniimation controller${_animationController.value}");
    });
    _animationController.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        isFav = true;
      }
      if (status == AnimationStatus.dismissed) {
        isFav = false;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return InkWell(
              onTap: () {
                isFav
                    ? _animationController.reverse()
                    : _animationController.forward();
              },
              child:
                  Icon(Icons.favorite, size: _sizeAnimation.value, color: _colorAnimation.value),
            );
          },
        ),
      ),
    );
  }
}
