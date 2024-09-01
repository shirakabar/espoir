import 'package:flutter/material.dart';
import 'package:koyo/map/map.dart';
double expander = 0;

double topShifter(double a){
  return expander * a / 10 - 4 * expander + 40;
}

double leftShifter(double a){
  return expander * a / 10 - expander + 10;
}

//博覧ページのタブ遷移先

class ThirdFloor extends StatelessWidget {
  const ThirdFloor({super.key});
  
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
            child: Image.asset('assets/images/3f.png'),
          ),
          // Positionedで配置
          Positioned(
            top: topShifter(190),
            left: leftShifter(330),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '101')
          ),
          Positioned(
            top: topShifter(190),
            left: leftShifter(285),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '102')
          ),
          Positioned(
            top: topShifter(190),
            left: leftShifter(240),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '103')
          ),
          Positioned(
            top: topShifter(190),
            left: leftShifter(190),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '104')
          ),
          Positioned(
            top: topShifter(190),
            left: leftShifter(145),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '105')
          ),
          Positioned(
            top: topShifter(190),
            left: leftShifter(110),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '106')
          ),
          Positioned(
            top: topShifter(190),
            left: leftShifter(50),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '107')
          ),
          // Positionedで配置
          Positioned(
            top: topShifter(110),
            left: leftShifter(330),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '307')
          ),
          Positioned(
            top: topShifter(110),
            left: leftShifter(285),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '306')
          ),
          Positioned(
            top: topShifter(110),
            left: leftShifter(240),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '305')
          ),
          Positioned(
            top: topShifter(110),
            left: leftShifter(190),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '304')
          ),
          Positioned(
            top: topShifter(110),
            left: leftShifter(145),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '303')
          ),
          Positioned(
            top: topShifter(110),
            left: leftShifter(110),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '302')
          ),

          Positioned(
            top: topShifter(110),
            left: leftShifter(50),
            width: 50.0,
            height: 50.0,
            child: Classbutton(classname: '301')
          ),
        ],
      ),
    );
  }
}