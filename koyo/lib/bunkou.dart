import 'package:flutter/material.dart';
import 'package:koyo/bunka.dart';
import 'package:koyo/kouya.dart';

//文化、後夜のタブ遷移先一覧

class Bunkou extends StatefulWidget {

  const Bunkou({super.key});

  @override
  State<Bunkou> createState() => _Bunkou();
}

class _Bunkou extends State<Bunkou> {
  int _currentpageindex = 0;

  void _taptab(int index) {
    setState(() {
      _currentpageindex = index;
  });
  }
  static const List<Widget> _widgetoptions = <Widget>[
    Bunka(),
    Kouya(),
  ] ;

  @override
  
   Widget build(BuildContext context) {//丸ごとスクロールしたい
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('文化祭・後夜祭',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        bottom: TabBar(
        onTap: _taptab,
        tabs: const [
           Tab( text:'文化祭'),
           Tab( text:'後夜祭'),        
        ],
         unselectedLabelColor: Colors.white,
         labelColor: Colors.white,
         indicatorColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(child: 
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      child: 
        Expanded(child: 
          Container(
            child: _widgetoptions.elementAt(_currentpageindex)
          )
        )
    ),
    ),
    
      )
      
    );
    
}
}