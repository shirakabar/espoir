import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Resultlist extends StatefulWidget {
  const Resultlist({super.key,required this.classdetailList,required this.sportsdetail});

  final dynamic classdetailList;
  final dynamic sportsdetail;

  @override
  State<Resultlist> createState() => _Resultlist();
}

class _Resultlist extends State<Resultlist> {
  
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

  void deleteValue({required String classname,required dynamic sportsdetail}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference documentReference = firestore.collection('Results').doc('taiikusairesult');

    await documentReference.update({
      '${sportsdetail.sportstitle}.${sportsdetail.order}.$classname' : FieldValue.delete(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final classdetailList = widget.classdetailList;
    final sportsdetail = widget.sportsdetail;
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
              title: Text(classdetailList[index].classname,style: const TextStyle(fontSize: 16),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                Text('${classdetailList[index].point}点',style: const TextStyle(fontSize: 16),),
                IconButton(
                                  icon: Icon(Icons.delete,color: Colors.grey[700]),
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

}

class Floatingdialog extends StatefulWidget {
  const Floatingdialog({super.key});

  @override
  State<Floatingdialog> createState() => _Floatingdialog();
}

class _Floatingdialog extends State<Floatingdialog> {
  final TextEditingController _sportscontroller = TextEditingController();
  final TextEditingController _ordercontroller = TextEditingController();

    @override
  void dispose() {
    _sportscontroller.dispose();
    _ordercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            ?  () {
                            }
                            : () { try{
                              FirebaseFirestore.instance
                                    .collection("Results")
                                    .doc("taiikusairesult")
                                    .update({
                                  _sportscontroller.text: {
                                    _ordercontroller.text: {}
                                    }
                                  });
                                }catch(e) {
                                  debugPrint(e.toString());
                                  debugPrint(_sportscontroller.text);
                                  debugPrint(_ordercontroller.text);
                                }

                                Navigator.pop(context);

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
}

class Resultdialog extends StatefulWidget {
  const Resultdialog({super.key,required this.sportsdetail});

  final dynamic sportsdetail;

  @override
  State<Resultdialog> createState() => _Resultdialog();
}

class _Resultdialog extends State<Resultdialog> {
  final TextEditingController _classcontroller = TextEditingController();
  final TextEditingController _pointcontroller = TextEditingController();
  final TextEditingController _placecontroller = TextEditingController();

    @override
  void dispose() {
    _classcontroller.dispose();
    _pointcontroller.dispose();
    _placecontroller.dispose();
    super.dispose();
  }

    void updateValue({required String classname,required dynamic point,required dynamic place,required dynamic sportsdetail}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference documentReference = firestore.collection('Results').doc('taiikusairesult');

    await documentReference.update({
      '${sportsdetail.sportstitle}.${sportsdetail.order}.$classname.point' : point,
      '${sportsdetail.sportstitle}.${sportsdetail.order}.$classname.place' : place,
    });
  }


  @override
  Widget build(BuildContext context) {
    final sportsdetail = widget.sportsdetail;
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
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            labelText: 'ブロック名(例:青ブロック)',
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

                                Navigator.pop(context);

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
}