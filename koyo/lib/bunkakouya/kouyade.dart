import 'package:flutter/material.dart';
import 'package:koyo/bunkakouya/bunkoushowde.dart';
import 'package:koyo/data/kouyasaidata.dart';
//文化祭のdetail各ページの詳細

class Kouyagym extends StatelessWidget {
  Kouyagym({super.key});

 final _gymdata = GymdataList().gymdata;

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
            itemCount: _gymdata.length,
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
                leading: Text(_gymdata[index].number,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                title: Text(_gymdata[index].title,style: const TextStyle(fontSize: 20),),
                tileColor: const Color.fromARGB(255, 241, 249, 255),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Bunkoushowde(title: _gymdata[index].title, place: '体育館', detail: _gymdata[index].detail, number: _gymdata[index].number)));
                },//gorouterでのタップ時遷移　仮
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

class Kouyaground extends StatelessWidget {
  Kouyaground({super.key});

 final _grounddata = GrounddataList().grounddata;
 
  @override
   Widget build(BuildContext context) {
    
    return Scaffold(body: 
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
            itemCount: _grounddata.length,
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
                leading: Text(_grounddata[index].number,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                title: Text(_grounddata[index].title,style: const TextStyle(fontSize: 20),),
                tileColor: const Color.fromARGB(255, 241, 249, 255),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Bunkoushowde(title: _grounddata[index].title, place: 'グラウンド', detail: _grounddata[index].detail, number: _grounddata[index].number)));
                },//gorouterでのタップ時遷移　仮
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

class Ondemand extends StatelessWidget {
  Ondemand({super.key});

 final _ondemanddata = OndemanddataList().ondemanddata;
 
  @override
   Widget build(BuildContext context) {
    
    return Scaffold(body: 
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children:[
           const SizedBox(
          height: 10,
        ),
        const Center(child:
        Text('配信一覧',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),), 
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(child: ListView.builder(//体育祭の各種目を一覧表示
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _ondemanddata.length,
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
                leading: Text(_ondemanddata[index].number,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                title: Text(_ondemanddata[index].title,style: const TextStyle(fontSize: 20),),
                tileColor: const Color.fromARGB(255, 241, 249, 255),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Bunkoushowde(title: _ondemanddata[index].title, place: 'オンデマンド', detail: _ondemanddata[index].detail, number: _ondemanddata[index].number)));
                },
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


