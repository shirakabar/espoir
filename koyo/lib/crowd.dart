/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//管理者用の混雑度変更ページ

class Crowd extends StatefulWidget{
  const Crowd({super.key});

  @override
  State<Crowd>  createState() => _Crowd();
}

class _Crowd extends State<Crowd>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('classes')
                      .snapshots(),
                       builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('エラーが発生しました');
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final Map<String, int> content = 
                    
                    snapshot.requireData.docs
                        .map<dynamic>((DocumentSnapshot document) {
                      final documentData =
                          document.data()! as int;
                    }).toList();//wakannai
                    return Flexible(
                      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder:  (BuildContext context, int index) {
            return Row(
               crossAxisAlignment: CrossAxisAlignment.start,
              children:[
            DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text('1'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('2'),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text('3'),
                ),
              ],
              onChanged: (dynamic value) {
                setState(() {
                   content[index] = value;
                });
              },
              value: content[index],
            ),
      
      Text(content[index],style: const TextStyle(fontSize: 10),),
              ]
            );
                      },
                    ),
                    );
                       }
              ) ,
      );
    
  }
}*/
                    
        