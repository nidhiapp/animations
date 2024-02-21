import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

double defaultWidth = 100.0;

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  bool isZommed = false;
  String _buttonTitle = "Zommed In";
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
                duration: Duration(microseconds: 360),
                curve: _curve,
                width: _width,
                child: Image.asset("assets/images/girl.png")),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isZommed = !isZommed;
                    _buttonTitle = isZommed ? "Zoomed In" : "Zoomed Out";
                    _width = isZommed
                        ? MediaQuery.of(context).size.width
                        : defaultWidth;
                    _curve = isZommed ? Curves.bounceInOut : Curves.bounceOut;
                  });
                },
                child: Text(_buttonTitle))
          ],
        ),
      ),
    );
  }
}
