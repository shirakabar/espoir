import 'package:flutter/material.dart';
import 'package:koyo/bunkade.dart';

//文化祭ページのタブ遷移先一覧

class Bunka extends StatefulWidget {

  const Bunka({super.key});

  @override
  State<Bunka> createState() => _Bunka();
}

class _Bunka extends State<Bunka> {
  int _currentpageindex = 0;

  void _taptab(int index) {
    setState(() {
      _currentpageindex = index;
  });
  }
  static const List<Widget> _widgetoptions = <Widget>[
    Bunkagym()
  ] ;//体育館、運動場、オンデマンド

  @override
  
   Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child:  Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [ const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,),
          child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                  children:[ 
                    Text('体育祭',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 40),),
                Text('1月1日（月）08:00 ~08:00',style: TextStyle(fontSize: 20),),
                  ]
            ),
        ),
        
          TabBar(
        onTap: _taptab,
        tabs: const [
           Tab( text:'体育館'),
           Tab( text:'半日教室'),
           Tab( text:'その他'),
        ],
      
        ),

        Expanded(
          child: Container(
            child: _widgetoptions.elementAt(_currentpageindex)
          )
        ,)
        
        ],
    ),
    
    );
    
}
}
