import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class Ticket extends StatefulWidget{
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _Ticket();
}

class _Ticket extends State<Ticket>{

List<String> hour =['10:00','11:00','12:00','13:00','14:00','15:00'];
List<String> half =['10:30','11:30','12:30','13:30','14:30'];

final num =0;


  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();//現在時刻　hh:mmの形
    final int nowcom = now.hour * 100 + now.minute + 900;//現在時刻　hhmmの整数 9時間足して日本時間に変換

    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('整理券取得',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        //注意書きsitaiii
        const Text('希望の時間帯を選択してください',style: TextStyle(fontSize: 20),),
        const SizedBox(height:25),
        StreamBuilder<QuerySnapshot>(
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
                    final doc = docs[num];
                    final data = doc.data()! as Map<String?,dynamic>;
                    
                    return Expanded(child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                     taphour () {                 
                        FirebaseFirestore.instance
                        .collection('classes')
                        .doc(doc.id)
                        .update({hour[index] : data[hour[index]] - 1 });
                        FirebaseFirestore.instance
                        .collection('Users')
                        .doc()
                        .update({doc.id : hour[index]});
                         context.go('/');
                     }

                     taphalf () {                 
                        FirebaseFirestore.instance
                        .collection('classes')
                        .doc(doc.id)
                        .update({half[index] : data[half[index]] - 1 });
                        FirebaseFirestore.instance
                        .collection('Users')
                        .doc()
                        .update({doc.id : half[index]});
                         context.go('/');
                     }

                     final int hourcom = int.parse(hour[index].replaceAll(':',""));//整理券の時間hhmmの整数
                     final int halfcom = int.parse(half[index].replaceAll(':',""));

                      return Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,//均等に横に並べる
                     children: [
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical:7),
                      child: OutlinedButton(
                       onPressed: data[hour[index]] < 1 || hourcom <= nowcom ? null :() => taphour(),//三項演算子をつかうらしい ||はOR
                       style: OutlinedButton.styleFrom(
                       backgroundColor: Colors.transparent,//背景透明
                       side: BorderSide(color: Theme.of(context).primaryColor),
                       fixedSize: const Size(135, 50)
                       ),
                       child: Text('${hour[index]}~${half[index]} 残り${data[hour[index]]} '),
                       ),),

                       Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical:7),
                      child: OutlinedButton(
                       onPressed: data[half[index]] < 1 || halfcom <= nowcom ? null :() => taphalf(),//三項演算子をつかうらしい ||はOR
                       style: OutlinedButton.styleFrom(
                       backgroundColor: Colors.transparent,//背景透明
                       side: BorderSide(color: Theme.of(context).primaryColor),
                       fixedSize: const Size(135, 50)
                       ),
                       child: Text('${half[index]}~${hour[index + 1]} 残り${data[half[index]]}'),
                       ),)
                     ]
                      );
                    }
                    
                    )
                    );
                  }
      )
      ]
      )
      )
      );
                  }
}