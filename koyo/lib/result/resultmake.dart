import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:koyo/widget/widget.dart';
import 'package:koyo/result/resultwidget.dart';

class Classdetail {
  const Classdetail(
      {required this.classname, required this.point, required this.place});

  final String? classname;
  final int? point;
  final int? place;
}

class Sportsdetail {
  const Sportsdetail({
    required this.order,
    required this.sportstitle,
    required this.classdetailList
    });

  final int order;
  final String sportstitle;
  final List<Classdetail> classdetailList;
}

class Resultmakesp extends StatefulWidget {
  const Resultmakesp({super.key});

  @override
  State<Resultmakesp> createState() => _Resultmakesp();
}

class _Resultmakesp extends State<Resultmakesp> {
   
    Widget deletesportsdialog({required sports}) {
    return AlertDialog(
      title: const Text("競技削除"),
      content: Text(
        "${sports.sportstitle}の結果を削除します\n本当によろしいですか？",
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
            child: const Text("削除"),
            onPressed: () {
              try {
                FirebaseFirestore.instance
                    .collection('Results')
                    .doc('taiikusairesult')
                    .update({sports.sportstitle: FieldValue.delete()});
                const snackBar = SnackBar(
                  content: Text("競技を削除しました"),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
              } catch (e) {
                const snackBar = SnackBar(
                  content: Text("エラーが発生しました"),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
              }
            }),
        TextButton(
          child: const Text("閉じる"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: '体育祭結果更新'),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const Floatingdialog();
                  });
            },
            child: const Icon(Icons.add)),
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
                  debugPrint('data:$data'); 
                      //data: {男女リレー: {3: {105: {place: 5, point: 5}, 106: {place: 6, point: 6}}}, 向陽リレー: {1: {101: {place: 1, point: 1}, 102: {place: 2, point: 2}}}}

                  classes.forEach((String? classname, dynamic classresults) {
                    classdetailList.add(Classdetail(
                      classname: classname,
                      place: classresults["place"],
                      point: classresults["point"],
                    ));
                  });
                  classdetailList
                      .sort((a, b) => a.place!.compareTo(b.place as num));
                  sportsList.add(Sportsdetail(
                      order: int.parse(order),
                      sportstitle: sportstitle,
                      classdetailList: classdetailList));
                });
              });
              sportsList.sort((a, b) => a.order.compareTo(b.order));

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                       horizontal: 15,vertical: 2
                      ),
                      child: 
                        Card(
                          color: const Color.fromARGB(255, 241, 249, 255),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                      padding: const EdgeInsets.only(
                        right: 10, left: 10,top: 10,bottom: 20
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: Text(sportsList[index].order.toString(),style: const TextStyle(fontSize: 18),),
                            title: Text(
                              sportsList[index].sportstitle,
                              style: const TextStyle(fontSize: 18),
                            ),
                            trailing:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              IconButton(
                                  icon: const Icon(Icons.add,color: Colors.black), onPressed: () {
                                    showDialog(
                                    context: context,
                                        builder: (context) {
                                          return Resultdialog(sportsdetail: sportsList[index]);
                                        }
                                  );}),
                              IconButton(
                                  icon: const Icon(Icons.delete,color: Colors.black),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return deletesportsdialog(sports: sportsList[index]);
                                        });
                                  }),
                            ]),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          Resultlist(classdetailList: sportsList[index].classdetailList, sportsdetail: sportsList[index])
                          ],),
                      ))
                      );
                },
              );
            }));
  }
}
