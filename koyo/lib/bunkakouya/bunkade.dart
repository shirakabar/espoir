import 'package:flutter/material.dart';
import 'package:koyo/data/bunkasaidata.dart';
import 'package:koyo/pdfview.dart';
//文化祭のdetail各ページの詳細

class Bunkagym extends StatefulWidget {

  const Bunkagym({super.key});

  @override
  State<Bunkagym> createState() => _Bunkagym();
}

class _Bunkagym extends State<Bunkagym> {
 final _bunkasaidata = BunkasaidataList().bunkasaidata;
  @override
  
   Widget build(BuildContext context) {
    
    return Scaffold(
      body: 
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children:[
           const SizedBox(
          height: 10,
        ),
        const Center(child:
        Text('スケジュール',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),), 
        ),
        const SizedBox(
          height: 10,
        ),
        
        Expanded(child: ListView.builder(//体育祭の各種目を一覧表示
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _bunkasaidata.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(//ここからを表示
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
              child:
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
              child: ListTile(
                leading: Text(_bunkasaidata[index].time,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                title: Text(_bunkasaidata[index].title,style: const TextStyle(fontSize: 20),),
                subtitle: Text(_bunkasaidata[index].place),
                tileColor: const Color.fromARGB(255, 241, 249, 255),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(
                                    pdf: 'assets/docs/bunkasaipolicy.pdf',
                                    title: '文化祭実施要項')),
                          );
                },//タップ時遷移　仮
                 shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
              )
            )
            
        
            );
          }
          
         )
        )
      ]
      
      ),
      
    );
   }
}