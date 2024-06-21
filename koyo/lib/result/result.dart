import 'package:flutter/material.dart';
import 'package:koyo/result/resultde.dart';
import 'package:go_router/go_router.dart';
//体育祭などの結果発表ページ

class Result extends StatefulWidget{
  const Result({super.key});

  @override
  State<Result> createState() => _Result();
}

class _Result extends State<Result>{

@override
  Widget build(BuildContext context) {
 return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('結果発表',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [IconButton(
                  icon: const Icon(Icons.notifications),
                onPressed: () {
                  context.push('/news');
                },
       ),],
        bottom: TabBar(
        tabs: const [
           Tab( text:'体育祭'),
           Tab( text:'博覧会'),
        ],
         unselectedLabelColor: Colors.white,
         labelColor: Colors.white,
         indicatorColor: Colors.white,
         dividerColor: Theme.of(context).primaryColor,
        ),

      ),
      body:
        const TabBarView(
        children: [
           Resultsp(),
           Resultsp(),
          ],
        )
    ),    
    );
}
}