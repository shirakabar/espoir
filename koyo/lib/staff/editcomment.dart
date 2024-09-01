import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Editdialog extends StatefulWidget {
  const Editdialog({super.key});

  @override
  State<Editdialog> createState() => _Editdialog();
}

class _Editdialog extends State<Editdialog> {
  final TextEditingController _commentcontroller = TextEditingController();

    @override
  void dispose() {
    _commentcontroller.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    Color pickerColor =Theme.of(context).primaryColor;
    Color selectedColor = Theme.of(context).primaryColor;
    void changeColor(Color color) {
      pickerColor = color;
    }

    return SimpleDialog(title: const Text('コメント編集'), children: [
      SimpleDialogOption(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(
                    controller: _commentcontroller,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                      labelText: 'コメント',
                      floatingLabelStyle: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
                const SizedBox(height: 10, width: double.infinity),
                ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            pickerAreaHeightPercent: 0.8,
          ),
                Row(
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () { 
                          selectedColor = pickerColor;
                              FirebaseFirestore.instance
                                    .collection("Comment")
                                    .doc("comment")
                                    .update({'comment' : _commentcontroller.text });
                              FirebaseFirestore.instance
                                    .collection("Comment")
                                    .doc("comment")
                                    .update({'color' : selectedColor.toString()});
                                Navigator.pop(context);
                                const snackBar = SnackBar(
                                  content: Text("更新しました"),
                                  duration: Duration(seconds: 1),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                        child: const Text(
                          '更新',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 2,
                      width: 10,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
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