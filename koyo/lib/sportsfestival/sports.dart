import 'package:flutter/material.dart';
import 'package:koyo/data/basicdata.dart';
import 'package:koyo/data/sportsdata.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//体育祭のスケジュール一覧

class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _Sports();
}

class _Sports extends State<Sports> {
  final _taiikusaidata = TaiikusaidataList().taiikusaidata;
  final taiikusaidate = BasicData().taiikusaidate;
  final taiikusaiplace = BasicData().taiikusaiplace;

  // Future<void> result() async {
  //     final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //     String docId = 'result';
  //     Map<String, dynamic> fieldsToUpdate = {};
  //     for (int i = 1; i <= 192; i++) {
  //       fieldsToUpdate[i.toString()] = 0;  
  //     }
  //     await firestore.collection('springresult').doc(docId).set(fieldsToUpdate, SetOptions(merge: true));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            //スクロール可能
            child: Padding(
                //余白設定
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 12,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     // update();
                                  //     result();
                                  //   },
                                  //   style: ElevatedButton.styleFrom(
                                  //     foregroundColor: Colors.black, backgroundColor: Colors.white, // ボタンの文字色を黒に設定
                                  //   ),
                                  //   child: const Text(
                                  //     '値を全更新',
                                  //     style: TextStyle(
                                  //       fontSize: 16, 
                                  //       color: Colors.black, 
                                  //     ),
                                  //   ),
                                  // ),
                                const Text(
                                  '体育祭',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 35),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '$taiikusaidate$taiikusaiplace',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ])),
                      const SizedBox(
                        //間設定
                        height: 15,
                      ),
                      const Center(
                        child: Text(
                          'スケジュール',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          //体育祭の各種目を一覧表示
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _taiikusaidata.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                //ここからを表示
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 1),
                                child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListTile(
                                      leading: Text(
                                        _taiikusaidata[index].time,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      title: Text(
                                        _taiikusaidata[index].title,
                                        style: const TextStyle(fontSize: 21),
                                      ),
                                      //subtitle: Text(_taiikusaidata[index].place),
                                      tileColor: const Color.fromARGB(
                                          255, 241, 249, 255),
                                      onTap: null,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    )));
                          })
                    ]))));
  }
}
