import 'package:flutter/material.dart';
import 'package:koyo/map/map.dart';

double expander = 0;

double topShifter(double a) {
  return expander * a / 10 - 4 * expander + 40;
}

double leftShifter(double a) {
  return expander * a / 10 - expander + 10;
}

//マップ二階

class SecondFloor extends StatelessWidget {
  const SecondFloor({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    expander = (screenSize.width - 20) / 40;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Positionedで配置
          Positioned(
            left: 10,
            top: 40,
            width: 40 * expander,
            height: 25 * expander,
            child: Image.asset('assets/images/2f.png'),
          ),
          // Positionedで配置
          Positioned(
              top: topShifter(190),
              left: leftShifter(340),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '201')),
          Positioned(
              top: topShifter(190),
              left: leftShifter(300),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '202')),
          Positioned(
              top: topShifter(190),
              left: leftShifter(240),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '203')),
          Positioned(
              top: topShifter(190),
              left: leftShifter(190),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '204')),
          Positioned(
              top: topShifter(190),
              left: leftShifter(140),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '205')),
        ],
      ),
    );
  }
}
