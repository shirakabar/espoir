import 'package:flutter/material.dart';

//マップ一階
double expander = 0;

class FirstFloor extends StatelessWidget {
  const FirstFloor({super.key});

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
            child: Image.asset('assets/images/1f.png'),
          ),
          // Positionedで配置
        ],
      ),
    );
  }
}
