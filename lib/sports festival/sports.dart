import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/main.dart';

//体育祭のスケジュール一覧

class Sports extends StatefulWidget {
   const Sports({super.key});

   @override
   State<Sports> createState() => _Sports();
}

class _Sports extends State<Sports> {

List<String> sp= ["開会式","台風の目","女(80m*4)/男(160m*4)\nリレー 予選","パン買い競争","応援団",
"妨害玉入れ","8の字ジャンプ","十字綱引き","女(80m*4)/男(160m*4)\nリレー 上位決勝","部対抗リレー","閉会式"];//競技名のリスト
List<String> time= ["09:20","09:40","10:20","10:55","11:40","12:05","12:20","13:00","13:40","14:20","14:50","15:20"];//時間のリスト
List<String> spat= ["@クラス席","クラス対抗","ブロック対抗","クラス対抗","","クラス対抗","ブロック対抗","クラス対抗","ブロック対抗","クラス対抗","@クラス席"];//場所リスト

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const Bar(title: '体育祭',),
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
            itemCount: sp.length,
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
                leading: Text(time[index],style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                title: Text(sp[index],style: const TextStyle(fontSize: 20),),
                subtitle: Text(spat[index]),
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