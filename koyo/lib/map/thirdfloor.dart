import 'package:flutter/material.dart';

//博覧ページのタブ遷移先

class ThirdFloor extends StatelessWidget {
  const ThirdFloor({super.key});
  
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
            child: Image.asset('images/3f.png'),
          ),
          // Positionedで配置
          Positioned(
            top: 190.0,
            left: 330.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('101'),),
          ),
          Positioned(
            top: 190.0,
            left: 285.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('102'),),
          ),
          Positioned(
            top: 190.0,
            left: 240.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('103'),),
          ),
          Positioned(
            top: 190.0,
            left: 190.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('104'),),
          ),
          Positioned(
            top: 190.0,
            left: 145.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('105'),),
          ),
          Positioned(
            top: 190.0,
            left: 110.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('106'),),
          ),
          Positioned(
            top: 190.0,
            left: 50.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('107'),),
          ),
          // Positionedで配置
          Positioned(
            top: 110.0,
            left: 330.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('307'),),
          ),
          Positioned(
            top: 110.0,
            left: 285.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('306'),),
          ),
          Positioned(
            top: 110.0,
            left: 240.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('305'),),
          ),
          Positioned(
            top: 110.0,
            left: 190.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('304'),),
          ),
          Positioned(
            top: 110.0,
            left: 145.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('303'),),
          ),
          Positioned(
            top: 110.0,
            left: 110.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('302'),),
          ),

          Positioned(
            top: 110.0,
            left: 50.0,
            width: 50.0,
            height: 50.0,
            child: TextButton(onPressed: () { /* ボタンがタップされた時の処理 */ },child: const Text('301'),),
          ),
        ],
      ),
    );
  }
}