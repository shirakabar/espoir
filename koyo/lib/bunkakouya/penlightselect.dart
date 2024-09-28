import 'package:flutter/material.dart';
import 'package:koyo/bunkakouya/penlight.dart';
import 'package:koyo/bunkakouya/penlightselectwidget.dart';

class Penlightselect extends StatefulWidget {
  const Penlightselect({super.key});
  //ペンライトのスタート画面

  @override
  State<Penlightselect> createState() => _Penlightselect();
}

class _Penlightselect extends State<Penlightselect> {
  Color? currentColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '※開始後、ダブルタップで終了します\n※スマートフォンを落とさないように注意してください\n※大変まぶしいので注意してください',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.white)),
                    onPressed: () async {
                      //ダイアログの戻り値を取得
                      currentColor = await showDialog<Color>(
                          context: context,
                          builder: (context) {
                            return const Penlightselectwidget();
                          });
                    },
                    child: const Text(
                      '色を選択',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Penlight(
                                  color: currentColor ?? Colors.black)));
                    },
                    child: const Text(
                      'スタート',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )));
  }
}
