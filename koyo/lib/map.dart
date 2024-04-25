import 'package:flutter/material.dart';
import 'package:koyo/fourthfloor.dart';
import 'package:koyo/firstfloor.dart';
import 'package:koyo/secondfloor.dart';
import 'package:koyo/thirdfloor.dart';

class Map extends StatelessWidget {
  const Map({super.key});
  
  @override
  
   Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 4,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('校内マップ',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        bottom: const TabBar(
        tabs: [
           Tab( text:'1F'),
           Tab( text:'2F'),
           Tab( text:'3F'),
           Tab( text:'4F'),
        ],
         unselectedLabelColor: Colors.white,
         labelColor: Colors.white,
         indicatorColor: Colors.white,
        ),

      ),
      body: InteractiveViewer(child:
      const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
           FirstFloor(),
           SecondFloor(),
           ThirdFloor(),
           FourthFloor(),
          ],
        )
    ),    
      )
    );
}
}