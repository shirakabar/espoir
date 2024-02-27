import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//体育祭のスケジュール一覧

class Sports extends StatefulWidget {
   const Sports({super.key});

   @override
   State<Sports> createState() => _Sports();
}

class _Sports extends State<Sports> {

List<String> sp= ["101","102","103","104","105","106","107","108","109"];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('体育祭',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body:  Padding(//naosu
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,),
          child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const Padding(
           padding: EdgeInsets.only(left:20,top:15),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                  children:[ 
                    Text('体育祭',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 40),),
                Text('1月1日（月）08:00 ~08:00',style: TextStyle(fontSize: 20),),
                  ]
            )
                  ),
        const SizedBox(
          height: 15,
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
                elevation: 0,
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
      )
      )
      )
        );
      
}
}