import 'package:flutter/material.dart';

//博覧ページのタブ遷移先

class FirstFloor extends StatelessWidget {
  const FirstFloor({super.key});
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Positionedで配置
          Positioned(
            left: 10,
            top: 40,
            width: 400,
            height: 250,
            child: Image.asset('assets/images/1f.png'),
          ),
          // Positionedで配置
        ],
      ),
    );
  }
}