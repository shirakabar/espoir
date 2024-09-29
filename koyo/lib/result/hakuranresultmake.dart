import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:koyo/result/hakuranresultde.dart';
import 'package:koyo/widget/widget.dart';

//博覧会結果作成
class Resultmakehakuran extends StatefulWidget {
  const Resultmakehakuran({super.key});

  @override
  State<Resultmakehakuran> createState() => _Resultmakehakuran();
}

class _Resultmakehakuran extends State<Resultmakehakuran> {
  final List resultdetaillist = const [
    Resultdetail(resultname: '向陽大賞', ismulti: false),
    Resultdetail(resultname: '一般大賞', ismulti: false),
    Resultdetail(resultname: 'ポスター大賞', ismulti: false),
    Resultdetail(resultname: '全校大賞', ismulti: true),
    Resultdetail(resultname: '学年ポスター大賞', ismulti: true),
  ];
  final List keyList = ['1年', '2年', '3年'];

  Widget _resultmulti(resultMap, resultname) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: resultMap.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
              leading: Text(
                keyList[index],
                style: const TextStyle(fontSize: 16),
              ),
              title: Text(
                resultMap[keyList[index]],
                style: const TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.edit, color: Colors.grey[700]),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Editdialog(
                              resultname: resultname,
                              gradename: (keyList[index]));
                        });
                  }),
            ),
            const Divider(
                height: 1, color: Colors.grey, indent: 5, endIndent: 5),
          ]);
        });
  }

  Widget _resultone(classname, reusltname) {
    return ListTile(
      title: Text(
        classname,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: IconButton(
          icon: Icon(Icons.edit, color: Colors.grey[700]),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Editdialog(resultname: reusltname);
                });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: '博覧会結果更新'),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Results')
                .doc('hakurankairesult')
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

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final eachresult = data[resultdetaillist[index].resultname];
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: Card(
                        color: const Color.fromARGB(255, 241, 249, 255),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10, top: 12, bottom: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      resultdetaillist[index].resultname,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                      width: double.infinity,
                                    ),
                                    (resultdetaillist[index].ismulti == true)
                                        ? _resultmulti(eachresult,
                                            resultdetaillist[index].resultname)
                                        : _resultone(eachresult,
                                            resultdetaillist[index].resultname)
                                  ],
                                ),
                              )
                            ]),
                      ));
                },
              );
            }));
  }
}

class Editdialog extends StatefulWidget {
  const Editdialog({super.key, required this.resultname, this.gradename});
  final String resultname;
  final String? gradename;

  @override
  State<Editdialog> createState() => _Editdialog();
}

class _Editdialog extends State<Editdialog> {
  final TextEditingController _classnamecontroller = TextEditingController();

  @override
  void dispose() {
    _classnamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultname = widget.resultname;
    final gradename = widget.gradename;
    return SimpleDialog(title: const Text('結果編集'), children: [
      SimpleDialogOption(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(
                    controller: _classnamecontroller,
                    onChanged: (value) => setState(() {}),
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
                    )),
                const SizedBox(height: 10, width: double.infinity),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {
                          if (gradename == null) {
                            FirebaseFirestore.instance
                                .collection("Results")
                                .doc("hakurankairesult")
                                .update(
                                    {resultname: _classnamecontroller.text});
                          } else {
                            FirebaseFirestore.instance
                                .collection("Results")
                                .doc("hakurankairesult")
                                .update({
                              '$resultname.$gradename':
                                  _classnamecontroller.text
                            });
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
