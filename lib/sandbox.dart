import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({super.key});

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  bool ischanged = false;
  double _margin = 10;
  Color _color = Colors.purple;
  double _opacity = 0.5;
  double _width = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        width: _width,
        margin: EdgeInsets.symmetric(horizontal: _margin, vertical: _margin),
        color: _color,
        duration: Duration(milliseconds: 400),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _margin = 50;
                    _color = Colors.purple;
                  });
                },
                child: Text("animate margin")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _color = Colors.green;
                  });
                },
                child: Text("animate color")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _width = 400;
                 
                  });
                },
                child: Text("animate width")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: Text("animate opacity")),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 2),
              child: Text(
                "hide me",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
