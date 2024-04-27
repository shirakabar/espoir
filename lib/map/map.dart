import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/widget.dart';
class Map extends StatelessWidget {
  const Map({super.key});
  
  @override
  
   Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
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
        children: [Stack(
          children: [ 
            Image.asset('images/mapone.jpg'),
            Positioned(
              top: 10.0,
              left:10.0,
              child: OutlinedButton(onPressed: () {},child: const Text('outlinedButton'))
            ),
            ]),
           Image.asset('images/maptwo.jpg'),
           Image.asset('images/mapthree.jpg'),
          ],
        )
    ),    
      )
    );
}
}