import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/widget/widget.dart';

class Staffselect extends StatelessWidget {
  const Staffselect({super.key});


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const Bar(title: 'スタッフ用'),
      body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(//ここからを表示
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:
              Column(children: [
                
                ListTile(
                        title: const Text('招集通知配信'),
                        onTap: () {
                          context.push('/push');
                        },
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),      
                ListTile(
                        title: const Text('結果更新'),
                        onTap: () {
                          context.push('/resultmake');
                        },
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),      

              ],)
            )],
         )
        );
      
}
}