import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Penlightselectwidget extends StatefulWidget {
  const Penlightselectwidget({super.key});
  //ペンライトの色設定ダイアログ

  @override
  State<Penlightselectwidget> createState() => _Penlightselectwidget();
}

class _Penlightselectwidget extends State<Penlightselectwidget> {
  Color currentColor = Colors.black;
  void changeColor(Color color) => setState(() => currentColor = color);  

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(title: const Text('色選択'), children: [
      SimpleDialogOption(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Text('黒を選択すると色が自動になります',style: TextStyle(fontSize: 20),),
                const SizedBox(height: 10, width: double.infinity),
                BlockPicker(
            pickerColor: currentColor, 
            onColorChanged: changeColor,
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {
                          Navigator.pop(context, currentColor);//色を戻り値としてかえす
                        },
                        child: const Text(
                          '完了',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 2,
                      width: 10,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('閉じる',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))
                  ],
                )
              ])))
    ]);
  }
}