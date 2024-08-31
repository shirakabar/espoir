import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Commentwidget extends StatefulWidget{
  const Commentwidget({super.key});

  @override
  State<Commentwidget> createState() => _Commentwidget();
}

class _Commentwidget extends State<Commentwidget>{
  final String usualtext = '向陽祭は9月5日から‼';

  Widget commentbox(text) {
    return Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColor,
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
 return StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Comment')
                .doc('comment')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return commentbox(usualtext);
              }
              if (!snapshot.hasData) {
                return commentbox(usualtext);
              }
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return (data['comment'] == '') ? commentbox(usualtext) : commentbox(data['comment']);
            }
                    );
 }
 }