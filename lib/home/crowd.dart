import 'package:flutter/material.dart';
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
                    
                    final docs = snapshot.data!.docs;
                    return Flexible(
        child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: docs.length,
        itemBuilder:  (BuildContext context, int index) {
           final doc = docs[index];
           final data = doc.data()! as Map<String,dynamic>;
           final List<Widget> crowdimg = <Widget>[
             Image.asset('images/crowdone.jpg'),
             Image.asset('images/crowdtwo.jpg'),
             Image.asset('images/crowdthree.jpg'),
           ];
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                   child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text(doc.id,style: const TextStyle(fontSize: 30),),
                SizedBox(
              width: 50,
              height: 50,
              child: crowdimg.elementAt(data['crowd']),
            ),
            DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 0,
                  child: Text('1'),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('2'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('3'),
                ),
              ],
              onChanged: (value) {
               FirebaseFirestore.instance
                        .collection('classes')
                        .doc(doc.id)
                        .update({'crowd' : value});
              },
              value: data['crowd'],
            ),           
              ]
                   )
            );
                      },
                    ),
                    );
                       }
              )
      );
    
  }
}