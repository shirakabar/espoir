import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  const Map({super.key});
  
  @override
  
   Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
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
        ],
         unselectedLabelColor: Colors.white,
         labelColor: Colors.white,
         indicatorColor: Colors.white,
        ),

      ),
      body: InteractiveViewer(child:
      TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
           Image.asset('images/crowdone.jpg'),
           Image.asset('images/crowdtwo.jpg'),
           Image.asset('images/crowdthree.jpg'),
          ],
        )
    ),    
      )
    );
}
}