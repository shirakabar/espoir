import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koyo/data/localdata.dart';
import 'package:koyo/widget/bottomnavi.dart';
import 'package:koyo/widget/widget.dart';

class Ticket extends ConsumerStatefulWidget{
  const Ticket({super.key,required this.classname});

  final String classname;

  @override
  ConsumerState<Ticket> createState() => _Ticket();
}

class _Ticket extends ConsumerState<Ticket>{

List<String> hour =['10:00','11:00','12:00','13:00','14:00','15:00'];
List<String> half =['10:30','11:30','12:30','13:30','14:30'];
  //int nowcom = 0;//テスト用
  int nowcom = DateTime.now().hour * 100 + DateTime.now().minute;

  Future<void> saveTicket(start, end, classname) async {
    String day = '${DateTime.now().month}/${DateTime.now().day}';
    Map<String,dynamic> jsonData = {'time' : '$start ~ $end','classname' : classname,'day' : day,'starttime' : start};
    final jsonString = jsonEncode(jsonData).toString();
    await LocalData.saveLocalData(start, jsonString);
  }
  
  void _onTimer(Timer timer) {
   DateTime now = DateTime.now();//現在時刻　hh:mmの形
   int nowint = now.hour * 100 + now.minute;//現在時刻　hhmmの整数 9時間足して日本時間に変換
   setState(() {
    nowcom = nowint;
   });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), _onTimer);
  }

  @override
  Widget build(BuildContext context) {
    final classname = widget.classname;

    return Scaffold(
      appBar:  Bar(title: '$classname整理券確認'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const Text('希望の時間帯を選択してください',style: TextStyle(fontSize: 20),),
        
        const SizedBox(height:25),
        StreamBuilder<DocumentSnapshot>(//各クラスのドキュメントをstreambuilderで監視
                  stream: FirebaseFirestore.instance
                  .collection('Ticket')
                  .doc(classname)
                  .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('エラーが発生しました');
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final data = snapshot.data;
                    
                    return Expanded(child: 
                    
                    ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                     onTapped (start, end) {          
                        FirebaseFirestore.instance
                        .collection('Ticket')
                        .doc(classname)
                        .update({start : data?[start] - 1 });
                        saveTicket(start, end, classname);
                        ref.watch(bottomnaviProvider.notifier).setindex(0);
                     }

                     final int hourcom = int.parse(hour[index].replaceAll(':',""));//整理券の時間hhmmの整数
                     final int halfcom = int.parse(half[index].replaceAll(':',""));

                      return Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,//均等に横に並べる
                     children: [
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical:7),
                      child: OutlinedButton(
                       onPressed: data?[hour[index]] < 1 || hourcom <= nowcom ? null :() => onTapped(hour[index], half[index]),//三項演算子をつかうらしい ||はOR
                       style: OutlinedButton.styleFrom(
                       backgroundColor: Colors.transparent,//背景透明
                       side: BorderSide(color: Theme.of(context).primaryColor),
                       fixedSize: const Size(135, 50)
                       ),
                       child: Text('${hour[index]}~${half[index]} 残り${data?[hour[index]]} '),
                       ),),

                       Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical:7),
                      child: OutlinedButton(
                       onPressed: data?[half[index]] < 1 || halfcom <= nowcom ? null :() => onTapped(half[index], hour[index + 1]),//三項演算子をつかうらしい ||はOR
                       style: OutlinedButton.styleFrom(
                       backgroundColor: Colors.transparent,//背景透明
                       side: BorderSide(color: Theme.of(context).primaryColor),
                       fixedSize: const Size(135, 50)
                       ),
                       child: Text('${half[index]}~${hour[index + 1]} 残り${data?[half[index]]}'),
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