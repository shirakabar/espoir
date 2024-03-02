import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//文化祭のdetail各ページの詳細

class Bunkagym extends StatefulWidget {

  const Bunkagym({super.key});

  @override
  State<Bunkagym> createState() => _Bunkagym();
}

class _Bunkagym extends State<Bunkagym> {

  List<String> sp= ["101","102","103","104","105","106","107","108","109"];
 
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
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
              child:
              Card(
                shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
          ),
              child: ListTile(
                leading: const Text('08:00',style: TextStyle(fontSize: 30),),
                title: Text(sp[index],style: const TextStyle(fontSize: 20),),
                subtitle: const Text('@グラウンド'),
                tileColor: Colors.white,
                onTap: () {
                  context.push('/$index');
                },
                 shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
              )
            )
            
        
            );
          }
          
         )
      ]
      
      ),
      
    );
   }
}