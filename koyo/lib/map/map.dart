import 'package:flutter/material.dart';
import 'package:koyo/map/fourthfloor.dart';
import 'package:koyo/map/firstfloor.dart';
import 'package:koyo/map/secondfloor.dart';
import 'package:koyo/map/thirdfloor.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/widget.dart';

class Map extends StatelessWidget {
  const Map({super.key});
  
  @override
  
   Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 4,
      child: Scaffold(
      drawer: const Draw(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('校内マップ',style: TextStyle(color: Colors.white)),
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
           Tab( text:'1F'),
           Tab( text:'2F'),
           Tab( text:'3F'),
           Tab( text:'4F'),
        ],
         unselectedLabelColor: Colors.white,
         labelColor: Colors.white,
         indicatorColor: Colors.white,
         dividerColor: Theme.of(context).primaryColor,
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