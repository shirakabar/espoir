import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//博覧のdetailそれぞれのページの内容記載

class Kyo extends StatefulWidget {
   const Kyo({super.key});

   @override
   State<Kyo> createState() => _Kyo();
}

class _Kyo extends State<Kyo> {

List<String> sp= ["101","102","103","104","105","106","107","108","109"];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(child:
        Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
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
                shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
          ),
              child: ListTile(
                leading: const Text('08:00',style: TextStyle(fontSize: 30),),
                title: Text(sp[index],style: const TextStyle(fontSize: 20),),
                subtitle: const Text('@グラウンド'),
                //tileColor: Colors.white,
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

class Butai extends StatefulWidget {
   const Butai({super.key});

   @override
   State<Butai> createState() => _Butai();
}

class _Butai extends State<Butai> {

List<String> sp= ["101","102","103","104","105","106","107","108","109"];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
         Expanded(
          child:ListView.builder(
            itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return  GestureDetector(
              onTap: ()  {
                context.push('/$index');
                  }, 
             child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey[50],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),

                   )
                ]
                ),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
              child: Column(
                children: [
                  Text(sp[index],style: const TextStyle(fontSize: 20),),
                  const Text("Title",style: TextStyle(fontSize: 15),)
              ],
            )
            )
            )
            );
          }
          )
         )
      ]
      )
      
        );
}
}

class Club extends StatefulWidget {
   const Club({super.key});

   @override
   State<Club> createState() => _Club();
}

class _Club extends State<Club> {

List<String> sp= ["101","102","103","104","105","106","107","108","109"];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
         Expanded(
          child:ListView.builder(
            itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return  GestureDetector(
              onTap: ()  {
                context.push('/$index');
                  }, 
             child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey[50],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),

                   )
                ]
                ),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
              child: Column(
                children: [
                  Text(sp[index],style: const TextStyle(fontSize: 20),),
                  const Text("Title",style: TextStyle(fontSize: 15),)
              ],
            )
            )
            )
            );
          }
          )
         )
      ]
      )
      
        );
}
}