import 'package:flutter/material.dart';
import 'package:koyo/hakurande.dart';

//博覧ページのタブ遷移先

class Hakuran extends StatefulWidget {

  const Hakuran({super.key});

  @override
  State<Hakuran> createState() => _Hakuran();
}

class _Hakuran extends State<Hakuran> {
  int _currentpageindex = 0;

  void _taptab(int index) {
    setState(() {
      _currentpageindex = index;
  });
  }
  static const List<Widget> _widgetoptions = <Widget>[
    Kyo(),
    Butai(),
    Club()
  ] ;

  @override
  
   Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('博覧会',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        bottom: TabBar(
        onTap: _taptab,
        tabs: const [
           Tab( text:'教室'),
           Tab( text:'舞台'),
           Tab( text:'その他'),
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