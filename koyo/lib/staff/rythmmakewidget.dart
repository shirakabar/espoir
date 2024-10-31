import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//リズム作成ダイアログ
class Rythmmakedialog extends StatefulWidget {
  const Rythmmakedialog({super.key});

  @override
  State<Rythmmakedialog> createState() => _Rythmmakedialog();
}

class _Rythmmakedialog extends State<Rythmmakedialog> {
  final TextEditingController _bpmcontroller = TextEditingController();

  @override
  void dispose() {
    _bpmcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        backgroundColor: Colors.black,
        title: const Text(
          'リズム作成',
          style: TextStyle(color: Colors.white),
        ),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                )),
          ),
          SimpleDialogOption(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                        controller: _bpmcontroller,
                        onChanged: (value) => setState(() {}),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                          labelText: 'BPM',
                          floatingLabelStyle:
                              TextStyle(fontSize: 12, color: Colors.white),
                        )),
                        const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: const BorderSide(color: Colors.white)),
                        onPressed: () {
                          final Timestamp now =
                              Timestamp.fromDate(DateTime.now());
                          final duration = 1000 / (int.parse(_bpmcontroller.text) / 60);
                          FirebaseFirestore.instance
                              .collection('Live')
                              .doc('rythm')
                              .set({'duration': duration.round(), 'starttime': now});
                            Navigator.pop(context);
                        },
                        child: const Text(
                          '作成',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 2,
                      width: 10,
                    ),
                  ])))
        ]);
  }
}
