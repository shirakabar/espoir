import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Classdetail {
  const Classdetail(
      {required this.classname, required this.point, required this.place});

  final String? classname;
  final int? point;
  final int? place;
}

class Sportsdetail {
  const Sportsdetail({required this.order,required this.sportstitle,required this.classdetailList});

  final int order;
  final String sportstitle;
  final List<Classdetail> classdetailList;
}

class Resultsp extends StatefulWidget {
  const Resultsp({super.key});

  @override
  State<Resultsp> createState() => _Resultsp();
}

class _Resultsp extends State<Resultsp> {
  Widget _resultlist(classdetailList) {
    if (classdetailList.isEmpty) {
      return const Text('入力をお待ちください');
    } else {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: classdetailList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {

          if (classdetailList[index].runtimeType != int) {
            return ListTile(
              leading: Text('${classdetailList[index].place}位'),
              title: Text(classdetailList[index].classname),
              trailing: Text('${classdetailList[index].point}点'),
            );
          }
          return null;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Results')
                .doc('taiikusairesult')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('エラーが発生しました');
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              final List<Sportsdetail> sportsList = [];

              data.forEach((String sportstitle, dynamic orders) {
                    orders.forEach((String order, dynamic classes) {
                      final List<Classdetail> classdetailList = [];
                      debugPrint('data:$data'); //data: {男女リレー: {3: {105: {place: 5, point: 5}, 106: {place: 6, point: 6}}}, 向陽リレー: {1: {101: {place: 1, point: 1}, 102: {place: 2, point: 2}}}}

                      classes.forEach((String? classname, dynamic classresults) {

                          classdetailList.add(Classdetail(
                            classname: classname,
                            place: classresults["place"],
                            point: classresults["point"],
                          ));
                      });
                      classdetailList.sort((a, b) => a.place!.compareTo(b.place as num));
                      sportsList.add(Sportsdetail(order: int.parse(order), sportstitle: sportstitle, classdetailList: classdetailList));
                    });
                  }); 
                    sportsList.sort((a,b) => a.order.compareTo(b.order));

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                    
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 241, 249, 255),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        sportsList[index].sportstitle,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                        width: double.infinity,
                                      ),
                                      _resultlist(sportsList[index].classdetailList)
                                    ],
                                  ),
                                ))
                          ]));
                },
              );
            }));
  }
}
