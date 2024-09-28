import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Commentwidget extends StatefulWidget{
  const Commentwidget({super.key});
  //ホームのコメントウィジェット

  @override
  State<Commentwidget> createState() => _Commentwidget();
}

class _Commentwidget extends State<Commentwidget>{
  final String usualtext = '向陽祭は9月5日から‼';//firebaseから文字が取得できなかった場合

  Color _parseColorFromString(String colorString) {//Firebaseからの色データをColorに変換
  String valueString = colorString.split('(0x')[1].split(')')[0]; // 'ff42a5f5'
  int value = int.parse(valueString, radix: 16);
  return Color(value);//
}

  Widget commentbox(text, color) {
    color ??= Theme.of(context).primaryColor;
    return Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color
                      ),
                      child: Center(
                          child: Text(
                        text,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
              );
  }

@override
  Widget build(BuildContext context) {
  final Color usualcolor = Theme.of(context).primaryColor;
 return StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Comment')
                .doc('comment')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return commentbox(usualtext, usualcolor);
              }
              if (!snapshot.hasData) {
                return commentbox('', usualcolor);
              }
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              final Color changedcolor = _parseColorFromString(data['color']);
              return (data['comment'] == '' && data['color'] == 'Color(0xff1976d2)') ? commentbox(usualtext, usualcolor) : commentbox(data['comment'], changedcolor);
            }
                    );
 }
 }