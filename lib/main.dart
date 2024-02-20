
import 'package:animations/simple_animations/3d_animation.dart';
import 'package:animations/simple_animations/blue_cont_anim.dart';
import 'package:animations/simple_animations/two_half_circles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ThreeDAnimations(),
    );
  }
}


