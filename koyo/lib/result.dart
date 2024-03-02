import 'package:flutter/material.dart';
import 'package:koyo/resultde.dart';

//体育祭などの結果発表ページ

class Result extends StatefulWidget{
  const Result({super.key});

  @override
  State<Result> createState() => _Result();
}

class _Result extends State<Result>{
 int _currentpageindex = 0;

  void _taptab(int index) {
    setState(() {
      _currentpageindex = index;
  });
  }
  static const List<Widget> _widgetoptions = <Widget>[
    Resultsp(),
    //ResultHa(),
  ] ;

@override
  Widget build(BuildContext context) {
 return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('結果発表',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        bottom: TabBar(
        onTap: _taptab,
        tabs: const [
           Tab( text:'体育祭'),
           Tab( text:'博覧会'),
        ],
         unselectedLabelColor: Colors.white,
         labelColor: Colors.white,
         indicatorColor: Colors.white,
        ),

      ),
      body:
        Expanded(
          child: Container(
            child: _widgetoptions.elementAt(_currentpageindex)
          )
        ,)
    ),    
    );
}
}