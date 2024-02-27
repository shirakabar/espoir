import 'package:flutter/material.dart';

class Map extends StatefulWidget {

  const Map({super.key});

  @override
  State<Map> createState() => _Map();
}

class _Map extends State<Map> {
  int _currentpageindex = 0;

  void _taptab(int index) {
    setState(() {
      _currentpageindex = index;
  });
  }
 final List<Widget> _widgetoptions = <Widget>[
    Image.asset('images/esupo.png'),
    Image.asset('images/esupo.png'),
    Image.asset('images/esupo.png'),
  ] ;//校内マップの画像

  @override
  
   Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('校内マップ',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        bottom:    TabBar(
        onTap: _taptab,
        tabs: const [
           Tab( text:'1F'),
           Tab( text:'2F'),
           Tab( text:'3F'),
        ],
         unselectedLabelColor: Colors.white,
         labelColor: Colors.white,
         indicatorColor: Colors.white,
        ),
      ),
      body: 
      Center(child: Expanded(
          child: Container(
            child: _widgetoptions.elementAt(_currentpageindex)
          )
        ,)
        
      )
    ),
    );
}
}