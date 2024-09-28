import 'package:flutter/material.dart';
import 'package:koyo/map/map.dart';

double expander = 0;

double topShifter(double a) {
  return expander * a / 10 - 4 * expander + 40;
}

double leftShifter(double a) {
  return expander * a / 10 - expander + 10;
}

//マップ四階

class FourthFloor extends StatelessWidget {
  const FourthFloor({super.key});

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
            child: Image.asset('assets/images/4f.png'),
          ),
          // Positionedで配置
          Positioned(
              top: topShifter(205),
              left: leftShifter(340),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '108')),
          Positioned(
              top: topShifter(205),
              left: leftShifter(290),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '109')),
          Positioned(
            top: topShifter(205),
            left: leftShifter(220),
            width: 50.0,
            height: 50.0,
            child: const TextButton(
              onPressed: null,
              child: Text('LL'),
            ),
          ),
          Positioned(
              top: topShifter(205),
              left: leftShifter(102),
              width: 100.0,
              height: 50.0,
              child: Classbutton(
                classname: '206',
                buttonname: '大講義室',
              )),

          Positioned(
              top: topShifter(120),
              left: leftShifter(340),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '309')),
          Positioned(
              top: topShifter(120),
              left: leftShifter(290),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '308')),
          Positioned(
              top: topShifter(120),
              left: leftShifter(240),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '307')),
          Positioned(
              top: topShifter(120),
              left: leftShifter(190),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '209')),
          Positioned(
              top: topShifter(120),
              left: leftShifter(150),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '208')),
          Positioned(
              top: topShifter(120),
              left: leftShifter(105),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '207')),
          Positioned(
              top: topShifter(120),
              left: leftShifter(40),
              width: 50.0,
              height: 50.0,
              child: Classbutton(classname: '206')),
        ],
      ),
    );
  }
}
