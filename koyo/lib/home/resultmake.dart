import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:koyo/widget.dart';

class Classdetail {
  const Classdetail(
      {required this.classname, required this.point, required this.place});

  final String? classname;
  final int? point;
  final int? place;
}

class Sportsdetail {
  const Sportsdetail(
      {required this.order,
      required this.sportstitle,
      required this.classdetailList});

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
  final TextEditingController _sportscontroller = TextEditingController();
  final TextEditingController _ordercontroller = TextEditingController();
  final TextEditingController _classcontroller = TextEditingController();
  final TextEditingController _pointcontroller = TextEditingController();
  final TextEditingController _placecontroller = TextEditingController();

  @override
  void dispose() {
    _sportscontroller.dispose();
    _ordercontroller.dispose();
    _classcontroller.dispose();
    _pointcontroller.dispose();
    _placecontroller.dispose();
    super.dispose();
  }

  Widget _resultlist({required classdetailList,required sportsdetail}) {
    if (classdetailList.isEmpty) {
      return const Text('結果がありません',style: TextStyle(fontSize: 17),);
    } else {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: classdetailList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              ListTile(
              leading: Text('${classdetailList[index].place}位',style: const TextStyle(fontSize: 16),),
              title: Text(classdetailList[index].classname,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                Text('${classdetailList[index].point}点',style: const TextStyle(fontSize: 16),),
                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return deleteclassdialog(classdetail: classdetailList[index],sportsdetail: sportsdetail);
                                        });
                                  }),
              ])
            ),
            const Divider(height: 1,color: Colors.grey,indent: 5,endIndent: 5),
            ],);
            
          } 
      );
    }
  }

  Widget floatingdialog() {
    return SimpleDialog(title: const Text('競技追加'), children: [
      SimpleDialogOption(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(
                    controller: _sportscontroller,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                      labelText: '競技名(例:向陽リレー)',
                      floatingLabelStyle: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
                const SizedBox(height: 10, width: double.infinity),
                TextField(
                  controller: _ordercontroller,
                  onChanged: (value) => setState(() {}),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    labelText: '順番',
                    floatingLabelStyle: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20, width: double.infinity),
                Row(
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: ( _sportscontroller.text == '' || _ordercontroller.text == '' ) 
                            ?  null
                            : () {
                                FirebaseFirestore.instance
                                    .collection("Results")
                                    .doc("taiikusairesult")
                                    .update({
                                  _sportscontroller.text: {
                                    _ordercontroller.text: {}
                                  }
                                });

                                const snackBar = SnackBar(
                                  content: Text("更新しました"),
                                  duration: Duration(seconds: 1),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                        child: const Text(
                          '更新',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 2,
                      width: 10,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('閉じる',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))
                  ],
                )
              ])))
    ]);
  }

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

  Widget deleteclassdialog({required dynamic classdetail,required dynamic sportsdetail}) {
    return AlertDialog(
      title: const Text("クラス削除"),
      content: Text(
        "${classdetail.classname}の結果を削除します\n本当によろしいですか？",
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
            child: const Text("削除"),
            onPressed: () {
              try {
               deleteValue(classname: classdetail.classname, sportsdetail: sportsdetail);
                const snackBar = SnackBar(
                  content: Text("クラスを削除しました"),
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

Widget _resultdialog({required sportsdetail}) {
    return SimpleDialog(
              title: const Text('結果追加'),
              children: [
                SimpleDialogOption(child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      TextField(
                        controller: _classcontroller,
                        onChanged: (value) => setState(() {}),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            labelText: 'クラス名(例:101)',
                            floatingLabelStyle: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                        )
                      ),
                      const SizedBox(height: 10, width: double.infinity),
                      TextField(
                        controller: _placecontroller,
                        onChanged: (value) => setState(() {}),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            labelText: '順位',
                            floatingLabelStyle: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                            ),                           
                              ),
                      ),
                      const SizedBox(height: 10, width: double.infinity),
                      TextField(
                        controller: _pointcontroller,
                        onChanged: (value) => setState(() {}),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            labelText: '点数',
                            floatingLabelStyle: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                            ),                           
                              ),
                      ),
                      const SizedBox(height: 20, width: double.infinity),
                      Row(children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                              backgroundColor: Theme.of(context).primaryColor,
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          onPressed: _classcontroller.text.isEmpty || _pointcontroller.text.isEmpty || _placecontroller.text.isEmpty ? null : () { 

                                updateValue(classname: _classcontroller.text,
                                place: int.parse(_placecontroller.text),
                                point: int.parse(_pointcontroller.text), 
                                sportsdetail: sportsdetail);
                              
                                const snackBar = SnackBar(
                                  content: Text("更新しました"),
                                  duration: Duration(seconds: 1),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                          child: const Text('更新',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          const SizedBox(height: 2,width: 10,),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                              backgroundColor: Theme.of(context).primaryColor,
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                            onPressed: () {
                            Navigator.pop(context);
                          }, child: const Text('閉じる',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))
                      ],)                      
                    ]))
                )
              ]
            );
  }

  void updateValue({required String classname,required dynamic point,required dynamic place,required dynamic sportsdetail}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference documentReference = firestore.collection('Results').doc('taiikusairesult');

    await documentReference.update({
      '${sportsdetail.sportstitle}.${sportsdetail.order}.$classname.point' : point,
      '${sportsdetail.sportstitle}.${sportsdetail.order}.$classname.place' : place,
    }).then((_) {
      debugPrint('yyyyyy');
    }).catchError((error) {

    }
    );
  }

  void deleteValue({required String classname,required dynamic sportsdetail}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference documentReference = firestore.collection('Results').doc('taiikusairesult');

    await documentReference.update({
      '${sportsdetail.sportstitle}.${sportsdetail.order}.$classname' : FieldValue.delete(),
    }).then((_) {
      debugPrint('yyyyyy');
    }).catchError((error) {

    }
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
                    return floatingdialog();
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
                  debugPrint(
                      'data:$data'); //data: {男女リレー: {3: {105: {place: 5, point: 5}, 106: {place: 6, point: 6}}}, 向陽リレー: {1: {101: {place: 1, point: 1}, 102: {place: 2, point: 2}}}}

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
                       horizontal: 10,vertical: 2
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
                                  icon: const Icon(Icons.add), onPressed: () {
                                    showDialog(
                                    context: context,
                                        builder: (context) {
                                          return _resultdialog(sportsdetail: sportsList[index]);
                                        }
                                  );}),
                              IconButton(
                                  icon: const Icon(Icons.delete),
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
                          _resultlist(classdetailList: sportsList[index].classdetailList,sportsdetail: sportsList[index])
                          ],),
                      ))
                      );
                },
              );
            }));
  }
}
