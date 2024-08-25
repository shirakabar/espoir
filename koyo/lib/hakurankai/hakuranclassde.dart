import 'package:flutter/material.dart';
import 'package:koyo/widget/widget.dart';

class KyoDe extends StatelessWidget {
  final String title;
  final String place;
  final String detail;
  final String classname;

  const KyoDe({
    super.key,
    required this.title,
    required this.place,
    required this.detail,
    required this.classname
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Bar(title: 'クラス詳細'),
      body: Padding(
           padding: const EdgeInsets.only(left:20,top:15),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(classname,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 35),),
            Text(place, style: const TextStyle(fontSize: 10)),
            const SizedBox(height: 15),
            Text(title,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 35),),
            const SizedBox(height: 15),
            Text(detail, style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 10),
            
          ]
        ),
      )
    );
  }
}