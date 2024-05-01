import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Classdetail {
  const Classdetail({
    required this.point,
    required this.place
    });

  final int? point;
  final int? place;
}



class Resultsp extends StatefulWidget{
  const Resultsp({super.key});

  @override
  State<Resultsp>  createState() => _Resultsp();
}

class _Resultsp extends State<Resultsp>{

  Widget _resultlist(classdetailList){
    return  ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: classdetailList.length,
        itemBuilder:  (BuildContext context, int index) {
            return const ListTile(
              leading: Text(''),
              title: Text(''),
              trailing: Text(''),
            );
                      },
                    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Results')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('エラーが発生しました');
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    
                    final docs = snapshot.data!.docs as Map;
                    final data = docs['result'] as Map;

                    return Flexible(
        child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: docs.length,
        itemBuilder:  (BuildContext context, int index) {

        final List<String> sportstitleList = List.from(data.keys);
        data.forEach((sportstitle, classresult) {
        final List<Classdetail> classdetailList = [];
        for (var map in classresult) {
          classdetailList.add(Classdetail(
            place: map["place"],
            point: map["point"],
          ));
        }
         debugPrint(classdetailList.toString());
        });
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                   child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              children:[
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 249, 255),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: 
              Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                   child: Column(
                children: [
                  Text(sportstitleList[index],style: const TextStyle(fontSize: 15),),
                  const SizedBox(height: 5,width: double.infinity,),
                  _resultlist(data)
                ],
              ),)
              )
              ]
                   )
            );
                      },
                    ),
                    );
                       }
              )
      );
    
  }
}