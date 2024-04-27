import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Resultsp extends StatefulWidget{
  const Resultsp({super.key});

  @override
  State<Resultsp>  createState() => _Resultsp();
}

class _Resultsp extends State<Resultsp>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Results')
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
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                   child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text(doc.id,style: const TextStyle(fontSize: 30),),
                Text('一位：${data['一位']}',style: const TextStyle(fontSize: 20),),
                Text('二位：${data['二位']}',style: const TextStyle(fontSize: 20),),
                Text('三位：${data['三位']}',style: const TextStyle(fontSize: 20),),
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