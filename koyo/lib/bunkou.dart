import 'package:flutter/material.dart';
import 'package:koyo/bunka.dart';
import 'package:koyo/kouya.dart';

//文化、後夜のタブ遷移先一覧

class Bunkou extends StatelessWidget {
  const Bunkou({super.key});
  
  @override
  
   Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('文化祭・後夜祭',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        bottom: const TabBar(
        tabs: [
           Tab( text:'文化祭'),
           Tab( text:'後夜祭'),
        ],
         unselectedLabelColor: Colors.white,
         labelColor: Colors.white,
         indicatorColor: Colors.white,
        ),

      ),
      body: const TabBarView(
        children: [
           Bunka(),
           Kouya(),
          ],
        )
    ),    
    );
}
}