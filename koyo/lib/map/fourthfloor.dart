import 'package:flutter/material.dart';

//博覧ページのタブ遷移先

class FourthFloor extends StatelessWidget {
  const FourthFloor({super.key});
  
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
            child: Image.asset('images/4f.png'),
          ),
          // Positionedで配置
          Positioned(
            top: 205.0,
            left: 340.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('108'),),
          ),
          Positioned(
            top: 205.0,
            left: 290.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('109'),),
          ),
          Positioned(
            top: 205.0,
            left: 210.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('LL'),),
          ),
          Positioned(
            top: 205.0,
            left: 110.0,
            width: 100.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('大講義室'),),
          ),

          
          Positioned(
            top: 120.0,
            left: 340.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('309'),),
          ),
          Positioned(
            top: 120.0,
            left: 290.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('308'),),
          ),
          Positioned(
            top: 120.0,
            left: 240.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('307'),),
          ),
          Positioned(
            top: 120.0,
            left: 190.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('209'),),
          ),
          Positioned(
            top: 120.0,
            left: 150.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('208'),),
          ),
          Positioned(
            top: 120.0,
            left: 105.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('207'),),
          ),
          Positioned(
            top: 120.0,
            left: 40.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('206'),),
          ),
        ],
      ),
    );
  }
}