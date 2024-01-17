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
  bool isFav = false;
  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(microseconds: 500), vsync: this);
    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_animationController);

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
    return 
     Center(
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
                child: Icon(Icons.favorite,
                    size: 50, color: _colorAnimation.value),
              );
            },
          ),
        ),
      
    );
  }
}
