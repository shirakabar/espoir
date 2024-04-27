import 'package:flutter/material.dart';

//博覧ページのタブ遷移先


class SecondFloor extends StatelessWidget {
  const SecondFloor({super.key});
  
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
            child: Image.asset('images/2f.png'),
          ),
          // Positionedで配置
          Positioned(
            top: 190.0,
            left: 340.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('201'),),
          ),
          Positioned(
            top: 190.0,
            left: 300.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('202'),),
          ),
          Positioned(
            top: 190.0,
            left: 240.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('203'),),
          ),
          Positioned(
            top: 190.0,
            left: 190.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('204'),),
          ),
          Positioned(
            top: 190.0,
            left: 140.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('205'),),
          ),
        ],
      ),
    );
  }
}