import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/widget.dart';
import 'package:koyo/data/sportsdata.dart';

//体育祭のスケジュール一覧

class Sports extends StatefulWidget {
   const Sports({super.key});

   @override
   State<Sports> createState() => _Sports();
}

class _Sports extends State<Sports> {

final _taiikusaidata = TaiikusaidataList().taiikusaidata;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const Bar(title: '体育祭'),
      drawer: const Draw(),
      body: SingleChildScrollView(//スクロール可能
        child: Padding(//余白設定
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 12,
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const Padding(
           padding: EdgeInsets.only(left:20,top:15),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                  children:[ 
                    Text('体育祭',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 35),),
                    SizedBox(
                      height: 5,
                    ),
                Text('6月19日（月）@日本ガイシホール',style: TextStyle(fontSize: 18),),
                  ]
            )
                  ),
        const SizedBox(//間設定
          height: 15,
        ),
        const Center(child:
        Text('スケジュール',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),), 
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(//体育祭の各種目を一覧表示
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _taiikusaidata.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(//ここからを表示
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
              child:
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
            //side: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
          ),
              child: ListTile(
                leading: Text(_taiikusaidata[index].time,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                title: Text(_taiikusaidata[index].title,style: const TextStyle(fontSize: 20),),
                subtitle: Text(_taiikusaidata[index].place),
                tileColor: const Color.fromARGB(255, 241, 249, 255),
                onTap: () {
                  context.push('/$index');
                },//gorouterでのタップ時遷移　仮
                 shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
              )
            )
            
        
            );
          }
          
         )
      ]
      )
      )
      )
        );
      
}
}