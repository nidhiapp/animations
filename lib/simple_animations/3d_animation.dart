import 'package:flutter/material.dart';

class ThreeDAnimations extends StatefulWidget {
  const ThreeDAnimations({super.key});

  @override
  State<ThreeDAnimations> createState() => _ThreeDAnimationsState();
}

class _ThreeDAnimationsState extends State<ThreeDAnimations> {
  double widthAndHeight = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [Container()],
        ),
      ),
    );
  }
}
