import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//体育祭のスケジュール一覧

class Ichiran extends StatefulWidget {
   const Ichiran({super.key});

   @override
   State<Ichiran> createState() => _Ichiran();
}

class _Ichiran extends State<Ichiran> {

@override
 Widget build(BuildContext context){
 return ListView.builder(//体育祭の各種目を一覧表示
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
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
                title: const Text('',style: TextStyle(fontSize: 20),),
                subtitle: const Text(''),
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
          
         );
}
}

class First extends StatefulWidget {
   const First({super.key});

   @override
   State<First> createState() => _First();
}

class _First extends State<First> {

@override
 Widget build(BuildContext context){
 return ListView.builder(//体育祭の各種目を一覧表示
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
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
                title: const Text('',style: TextStyle(fontSize: 20),),
                subtitle: const Text(''),
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
          
         );
}
}

class Second extends StatefulWidget {
   const Second({super.key});

   @override
   State<Second> createState() => _Second();
}

class _Second extends State<Second> {

@override
 Widget build(BuildContext context){
 return ListView.builder(//体育祭の各種目を一覧表示
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
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
                title: const Text('',style: TextStyle(fontSize: 20),),
                subtitle: const Text(''),
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
          
         );
}
}