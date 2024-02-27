import 'package:flutter/material.dart';

//後夜祭ページのタブ遷移先一覧

class Kouya extends StatefulWidget {

  const Kouya({super.key});

  @override
  State<Kouya> createState() => _Kouya();
}

class _Kouya extends State<Kouya> {
  int _currentpageindex = 0;

  void _taptab(int index) {
    setState(() {
      _currentpageindex = index;
  });
  }
  static const List<Widget> _widgetoptions = <Widget>[
    
  ] ;//体育館、運動場、オンデマンド

  @override
  
   Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      body: 
      
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),

      child: Column(
        children: [
          const Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                  children:[ 
                    Text('体育祭',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 40),),
                Text('1月1日（月）08:00 ~08:00',style: TextStyle(fontSize: 20),),
                  ]
            ),
          TabBar(
        onTap: _taptab,
        tabs: const [
           Tab( text:''),
           Tab( text:''),
        ],
      
        ),

        Expanded(
          child: Container(
            child: _widgetoptions.elementAt(_currentpageindex)
          )
        ,)
        
        ],
    ),
    ),
    )
    );
    
}
}