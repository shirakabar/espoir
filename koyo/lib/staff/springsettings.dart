import 'package:koyo/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:koyo/data/basicdata.dart';
import 'package:koyo/data/springdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:koyo/sportsfestival/spring.dart';

//スプリングフェアのスケジュール一覧

//お知らせ作成ページ
class Springsettings extends StatefulWidget {
  const Springsettings({super.key});

  @override
  State<Springsettings> createState() => _Springsettings();
}


class _Springsettings extends State<Springsettings> {
  List<Color> springDataIconColor = [];
  List<Color> springDataIconStyle = [];
  List<int> springDataResult2 = [];
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late Future<List<Map<String, dynamic>>> _springdatafire;
  List<int> selectedIndices = [];
  List<int> tempcompetition = [];
  List<int> tempclass = [];
  List<int> tempdate = [];
  List<int> temptime = [];
  List<int> searchitem = [];
  SpringdataList springdataList = SpringdataList();
  dynamic _springdata = SpringdataList().springdata;
  final springdate = BasicData().springdate;
  String _dateitems1 = dateitems[0];
  String _dateitemsA = dateitems[0];
  String _classitems1 = classesitems[0];
  String _classitemsA = classesitems[0];
  String competitionitems1 = competitionitems[0];
  String _competitionitemsA = competitionitems[0];
  String _selectedItem1 = items1[0];
  String _selectedItem2 = items2[0];
  String _selectedItemA = items1[0];
  String _selectedItemB = items2[0];
  String nothingtext = '';
  final String attentionchangenotification = '変更されました';

  late DateTime now; // DateTime now をクラスのフィールドとして定義
  late DateTime todayMidnight;
  late Duration difference;
  late int minutesPassed;
  int quantityTemp = items1.length;
  int temp = 0;
  int firstshow1 = 0;
  int firstshow2 = 0;
  int firstshow3 = 0;
  int firstshow4 = 0;
  int firstshow5 = 0;
  int searchItem1 = 0;
  int searchItem2 = 0;
  int searchItem3 = 0;
  int searchItem4 = 0;
  int searchItem5 = 0;
  int date = 1;
  int startspring = 0;
  int mainindexsetting = 0;

  int searchsystem1(String item1index) {
    if (item1index == '終了') {
      return 1441;
    } else if (item1index == '指定なし') {
      return 0;
    }
    // 文字列「HH:mm」形式を解析して DateTime に変換
    List<String> timeParts1 = item1index.split(":"); // 時間と分を分ける
    int hour1 = int.parse(timeParts1[0]);
    int minute1 = int.parse(timeParts1[1]);
    int minutestemp1 = (60 * hour1) + minute1;
    return minutestemp1;
  }

  // アイテム変更時のコールバック
  void _onSelectedItemChanged1(int index) {
    setState(() {
      _selectedItemA = items1[index]; // springdata.dart の items1 を使用
    });
  }

  void _onSelectedItemChanged2(int index) {
    setState(() {
      _selectedItemB = items2[index]; // springdata.dart の items1 を使用
    });
  }

  void _onSelectedItemChangeddate(int index) {
    setState(() {
      _dateitemsA = dateitems[index];
    });
  }

  void _onSelectedItemChangedcompetition(int index) {
    setState(() {
      _competitionitemsA = competitionitems[index];
    });
  }

  void _onSelectedItemChangedclass(int index) {


    setState(() {
      _classitemsA = classesitems[index];
    });
  }

  void competitionssearch() {
    tempcompetition.clear();
    for (int i = 0; i < springdataList.springLength; i++) {
      if (competitionitems1 == '指定なし') {
        for (int j = 0; j < springdataList.springLength; j++) {
          setState(() {
            tempcompetition.add(j);
          });
        }
      } else if (_springdata[i].competition == competitionitems1) {
        setState(() {
          tempcompetition.add(i);
        });
      }
    }
  }

  void clssessearch() {
    tempclass.clear();
    for (int i = 0; i < springdataList.springLength; i++) {
      if (_classitems1 == '指定なし') {
        for (int j = 0; j < springdataList.springLength; j++) {
          setState(() {
            tempclass.add(j);
          });
        }
      } else if (_springdata[i].team1 == _classitems1 ||
          _springdata[i].team2 == _classitems1) {
        setState(() {
          tempclass.add(i);
        });
      }
    }
  }

  void datesearch() {
    tempdate.clear();
    for (int i = 0; i < springdataList.springLength; i++) {
      if (_dateitems1 == '指定なし') {
        for (int j = 0; j < springdataList.springLength; j++) {
          setState(() {
            tempdate.add(j);
          });
        }
      } else if (_springdata[i].date == _dateitems1) {
        setState(() {
          tempdate.add(i);
        });
      }
    }
  }

  void timesearch() {
    temptime.clear();
    if (_selectedItem1 == '指定なし' && _selectedItem2 == '指定なし') {
      for (int i = 0; i < springdataList.springLength; i++) {
        setState(() {
          temptime.add(i);
        });
      }
    } else if (_selectedItem1 == '指定なし') {
      // items1 の範囲チェック
      if (searchItem2 >= items1.length) {
        return; // 処理を中断
      }
      for (int i = 0; i < springdataList.springLength; i++) {
        if (i >= _springdata.length) {
          break;
        }
        if (searchsystem1(_springdata[i].time) <=
            searchsystem1(items1[searchItem2])) {
          setState(() {
            temptime.add(i);
          });
        }
      }
    } else if (_selectedItem2 == '指定なし') {
      if (searchItem1 >= items1.length) {
        return; // 処理を中断
      }
      for (int i = 0; i < springdataList.springLength; i++) {
        if (i >= _springdata.length) {
          break;
        }
        if (searchsystem1(items1[searchItem1]) <=
            searchsystem1(_springdata[i].time)) {
          setState(() {
            temptime.add(i);
          });
        }
      }
    } else {
      for (int i = 0; i < springdataList.springLength; i++) {
        if (searchsystem1(items1[searchItem1]) <=
                searchsystem1(_springdata[i].time) &&
            searchsystem1(_springdata[i].time) <=
                searchsystem1(items1[searchItem2])) {
          setState(() {
            temptime.add(i);
          });
        }
      }
    }
  }

  List<int> findCommonElements(List<int> tempcompetition, List<int> tempclass,
      List<int> tempdate, List<int> temptime) {
    Set<int> commonElements = tempcompetition
        .toSet()
        .intersection(tempclass.toSet())
        .intersection(tempdate.toSet())
        .intersection(temptime.toSet());
    return commonElements.toList();
  }

  void search() {
    timesearch();
    competitionssearch();
    clssessearch();
    datesearch();
    searchitem =
        findCommonElements(tempcompetition, tempclass, tempdate, temptime);
    if (searchitem.isEmpty) {
      setState(() {
        nothingtext = '   該当する項目はありません';
      });
    } else {
      setState(() {
        nothingtext = '';
      });
    }
  }

  void start() {
    for (int i = 0; i < springdataList.springLength; i++) {
      setState(() {
        searchitem.clear();
        searchitem.add(i);
      });
    }
  }


  Future<List<Map<String, dynamic>>> readSpringdata() async {
    getresultData();
    final snapshot = await _db
        .collection('springdata')
        .get();

    // ドキュメントデータをリストに格納
    return snapshot.docs
        .map((doc) => doc.data())
        .toList();
  }

  Future<void> update() async {
  await clearCollection('springdata');
  await clearCollection('counters');
    Springdatafiredata fireData = Springdatafiredata();
    await fireData.updatedata();
  }
  Future<void> result() async {
    springDataResult2.clear();  
    int resultnumber = _springdata.length;
    if (resultnumber >= 1){
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      String docId = 'result';
      Map<String, dynamic> fieldsToUpdate = {};
      for (int i = 1; i <= resultnumber; i++) {
        fieldsToUpdate[i.toString()] = 0;  
      }
      await firestore.collection('springresult').doc(docId).set(fieldsToUpdate, SetOptions(merge: true));
    } else {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      String docId = 'result';
      Map<String, dynamic> fieldsToUpdate = {};
        fieldsToUpdate[1.toString()] = 0000;  
      await firestore.collection('springresult').doc(docId).set(fieldsToUpdate, SetOptions(merge: true)); 
    }
  }
Future<void> getresultData() async {
  springDataResult2.clear();  // リストを初期化
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // コレクション全体を取得
    QuerySnapshot snapshot = await firestore.collection('springresult').get();

    // ドキュメントが存在する場合に処理
    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // フィールド名を数値順にソート
        var sortedEntries = data.entries.toList()
          ..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key)));  // フィールド名を数値としてソート

        // 並び替えた結果をリストに追加
        for (var entry in sortedEntries) {
          if (entry.value is num) {
            springDataResult2.add(entry.value.toInt());  
          }
        }
      }
    } else {
      throw 'No documents found in the collection';
    }
  } catch (e) {
    throw 'Error retrieving data: $e';
  }
}
  @override
  void initState() {
    super.initState();
    startspring = 0;
    // now を initState 内で初期化
    now = DateTime.now();
    todayMidnight = DateTime(now.year, now.month, now.day);
    difference = now.difference(todayMidnight);
    minutesPassed = difference.inMinutes;
    _springdatafire = readSpringdata();
    start();
  }
Future<void> updateresult1(int mainindexsetting) async {
  int i = mainindexsetting + 1;
  String fieldName = '$i';
  String docId = 'result'; 
    if (springDataResult2[mainindexsetting] != 1) {
      await _db.collection('springresult').doc(docId).update({
        fieldName: 1,
      });
      setState(() {
        springDataResult2[mainindexsetting] = 1;
      });
    } else {
      await _db.collection('springresult').doc(docId).update({
        fieldName: 0,
      });
      setState(() {
        springDataResult2[mainindexsetting] = 0;
      });
  } 
}
Future<void> updateresult2(int mainindexsetting) async {
  int i = mainindexsetting + 1;
  String fieldName = '$i';
  String docId = 'result'; 
    if (springDataResult2[mainindexsetting] != 2) {
      await _db.collection('springresult').doc(docId).update({
        fieldName: 2,
      });
      setState(() {
        springDataResult2[mainindexsetting] = 2;
      });
    } else {
      await _db.collection('springresult').doc(docId).update({
        fieldName: 0,
      });
      setState(() {
        springDataResult2[mainindexsetting] = 0;
      });
  } 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: 'スプリングフェア設定'),
        body: FutureBuilder<List<Map<String, dynamic>>>(
            future: _springdatafire, // 非同期処理を渡す
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // ローディング中
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // エラー発生時
                return Center(child: Text('エラー: ${snapshot.error}'));
              } else {
                // データが正常に取得できた場合
                final springfire = snapshot.data!;
                List<Springdata> springdatafirestore = springfire
                    .map((map) =>
                        Springdata.fromMap(map)) // 各 `map` を `Springdata` に変換
                    .toList(); // リストに変換
                     if (startspring == 0) {
                springdataList.addData(springdatafirestore);
                searchitem.clear();
                for (int i = 0; i < springdataList.springLength; i++) {
                  searchitem.add(i);
                }
                _springdata = springdataList.springdata;
                     }
                startspring++;
                return SingleChildScrollView(
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
                              padding: const EdgeInsets.only(left: 0, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      update();
                                      result();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black, backgroundColor: Colors.white, // ボタンの文字色を黒に設定
                                    ),
                                    child: const Text(
                                      '値を全更新',
                                      style: TextStyle(
                                        fontSize: 16, 
                                        color: Colors.black, 
                                      ),
                                    ),
                                  ),
                                  const Center(
                                    child: Text(
                                      'スケジュール',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _showModalPicker1(context);
                                    },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Row(children: [
                                              Text(
                                                '  ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              Icon(
                                                Icons.filter_alt,
                                                size: 16,
                                                color: Colors.blue,
                                              ),
                                              Text(
                                                ' 絞り込み',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ]),
                                            Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 241, 249, 255),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: Colors.blue, // 枠の色
                                                  width: 2, // 枠の太さ
                                                ),
                                              ),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text.rich(TextSpan(
                                                            text: '日付：',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                            ),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text:
                                                                    _dateitems1,
                                                                style:
                                                                    const TextStyle(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ]) as InlineSpan),
                                                        Text.rich(TextSpan(
                                                            text: '   開始時刻： ',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                            ),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text:
                                                                    _selectedItem1,
                                                                style:
                                                                    const TextStyle(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              const TextSpan(
                                                                text: ' 〜 ',
                                                                style:
                                                                    TextStyle(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    _selectedItem2,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 12,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ]) as InlineSpan),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text.rich(TextSpan(
                                                            text: 'クラス：',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                            ),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text:
                                                                    _classitems1,
                                                                style:
                                                                    const TextStyle(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ]) as InlineSpan),
                                                        Text.rich(TextSpan(
                                                            text: '   種目：',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                            ),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text:
                                                                    competitionitems1,
                                                                style:
                                                                    const TextStyle(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ]) as InlineSpan),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              //スプリングフェアの各種目を一覧表示
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _springdata.length,
                              itemBuilder: (BuildContext context, mainindexsetting) {
                                if (searchitem.contains(mainindexsetting)) {
                                  // selectedIndicesリストに含まれるインデックスだけを表示
                                  return Padding(
                                    //ここからを表示
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 1),
                                    child: Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: ListTile(
                                          leading: SizedBox(
                                            width: 75,
                                            child: Align(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 0,
                                                      top: 0,
                                                    ),
                                                    child: Text(
                                                      _springdata[mainindexsetting].date,
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  Text(
                                                    _springdata[mainindexsetting].time,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    '@${_springdata[mainindexsetting].matchplace}',
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                updateresult1(mainindexsetting);
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: springDataResult2[mainindexsetting] == 1 ? Colors.blue : Colors.white,
                                                              ),
                                                              child: Text(
                                                                _springdata[mainindexsetting].team1,
                                                                style: const TextStyle(
                                                                  fontSize: 16, 
                                                                  color: Colors.black, 
                                                                ),
                                                              ),
                                                            ),
                                                            const Text(
                                                              ' VS ',
                                                                    ),
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                updateresult2(mainindexsetting);
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: springDataResult2[mainindexsetting] == 2 ? Colors.blue : Colors.white, // ボタンの文字色を黒に設定
                                                              ),
                                                              child: Text(
                                                                _springdata[mainindexsetting].team2,
                                                                style: const TextStyle(
                                                                  fontSize: 16, 
                                                                  color: Colors.black, 
                                                                ),
                                                              ),
                                                            )
                                                      ]),
                                                        Text(
                                                          _springdata[mainindexsetting]
                                                              .competition,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16),
                                                        ),


                                                      ]),
                                                ),
                                              ]),
                                          tileColor: const Color.fromARGB(
                                              255, 241, 249, 255),
                                          onTap: null,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(); // 空のコンテナを返す
                                }
                              },
                            ),
                            Text(
                              nothingtext,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            )
                          ])),
                );
              }
            }));
  }

  

  void _showModalPicker1(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color.fromARGB(255, 241, 249, 255),
      isScrollControlled: true, // 高さを自由に変更できるようにする
      isDismissible: true, // モーダル外をタップしてモーダルを閉じる
      enableDrag: true, // ユーザーがドラッグしてモーダルを閉じることができるようにする
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        double height = MediaQuery.of(context).size.height * 1;
        double width = MediaQuery.of(context).size.width * 1;
        return SizedBox(
          height: height * 0.93,
          child: GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // 左右に配置
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'キャンセル',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            for (int i = 0; i < items1.length; i++) {
                              if (items1[i] == _selectedItemA) {
                                searchItem1 = i;
                              }
                            }
                            for (int i = 0; i < items2.length; i++) {
                              if (items2[i] == _selectedItemB) {
                                searchItem2 = i;
                              }
                            }
                            if (searchItem2 == 0) {
                            } else if (searchItem1 > searchItem2) {
                              _selectedItemB = _selectedItemA;
                            }
                            setState(() {
                              _selectedItem1 = _selectedItemA;
                              _selectedItem2 = _selectedItemB;
                            });
                            firstshow1 = items1.indexOf(_selectedItemA);
                            firstshow2 = items2.indexOf(_selectedItemB);

                            for (int i = 0; i < dateitems.length; i++) {
                              if (items1[i] == _dateitemsA) {
                                searchItem3 = i;
                              }
                            }
                            setState(() {
                              _dateitems1 = _dateitemsA;
                            });
                            firstshow3 = dateitems.indexOf(_dateitemsA);
                            setState(() {
                              competitionitems1 = _competitionitemsA;
                              _classitems1 = _classitemsA;
                            });
                            firstshow4 =
                                competitionitems.indexOf(_competitionitemsA);
                            firstshow5 = classesitems.indexOf(_classitemsA);
                            Navigator.pop(context);
                            search();
                          },
                          child:
                              const Text('完了', style: TextStyle(fontSize: 16)),
                        ),
                      ]),
                ),
                Container(
                  width: width * 0.92,
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 0,
                  ).add(const EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 6)),
                        Text(
                          '開始時刻： $_selectedItem1 〜 $_selectedItem2',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 241, 249, 255),
                          thickness: 1, // 別の太さの区切り線
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 1つ目のCupertinoPicker
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 30,
                                  scrollController: FixedExtentScrollController(
                                      initialItem: firstshow1), // 初期アイテムの選択位置
                                  onSelectedItemChanged:
                                      _onSelectedItemChanged1,
                                  backgroundColor:
                                      const Color.fromARGB(0, 255, 255, 255),
                                  children:
                                      items1.map((item) => Text(item)).toList(),
                                ),
                              ),

                              const SizedBox(width: 10), // ピッカー間のスペースを空ける
                              const Text('〜'),
                              const SizedBox(width: 10), // ピッカー間のスペースを空ける
                              // 2つ目のCupertinoPicker
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 30,
                                  scrollController: FixedExtentScrollController(
                                      initialItem: firstshow2), // 初期アイテムの選択位置
                                  onSelectedItemChanged:
                                      _onSelectedItemChanged2,
                                  backgroundColor:
                                      const Color.fromARGB(0, 255, 255, 255),
                                  children:
                                      items2.map((item) => Text(item)).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: width * 0.92,
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 0,
                  ).add(const EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 6)),
                        Text(
                          '日付： $_dateitems1',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 241, 249, 255),
                          thickness: 1, // 別の太さの区切り線
                        ),
                        CupertinoPicker(
                          itemExtent: 40,
                          scrollController: FixedExtentScrollController(
                              initialItem: firstshow3), // 初期アイテムの選択位置
                          onSelectedItemChanged: _onSelectedItemChangeddate,
                          children:
                              dateitems.map((item) => Text(item)).toList(),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: width * 0.92,
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 0,
                  ).add(const EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 6)),
                        Text(
                          'クラス： $_classitems1',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 241, 249, 255),
                          thickness: 1, // 別の太さの区切り線
                        ),
                        CupertinoPicker(
                          itemExtent: 40,
                          scrollController: FixedExtentScrollController(
                              initialItem: firstshow5), // 初期アイテムの選択位置
                          onSelectedItemChanged: _onSelectedItemChangedclass,
                          children:
                              classesitems.map((item) => Text(item)).toList(),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: width * 0.92,
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 0,
                  ).add(const EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 6)),
                        Text(
                          '競技： $competitionitems1',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 241, 249, 255),
                          thickness: 1, // 別の太さの区切り線
                        ),
                        CupertinoPicker(
                          itemExtent: 40,
                          scrollController: FixedExtentScrollController(
                              initialItem: firstshow4), // 初期アイテムの選択位置
                          onSelectedItemChanged:
                              _onSelectedItemChangedcompetition,
                          children: competitionitems
                              .map((item) => Text(item))
                              .toList(),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12), // 余白を加える
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.blue, // 背景色を青に設定
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        onPressed: () {
                          for (temp = 0; temp <= quantityTemp - 1; temp++) {
                            int minutestemp = searchsystem1(items1[temp]);
                            if (minutesPassed <= minutestemp) {
                              setState(() {
                                _selectedItem1 = items1[temp];
                                _selectedItemA = items1[temp];
                                if (_selectedItem1 == '終了') {
                                  _selectedItem2 = items1[temp];
                                  _selectedItemB = items1[temp];
                                } else {
                                  _selectedItem2 = items1[temp + 1];
                                  _selectedItemB = items1[temp + 1];
                                }
                                firstshow1 = items1.indexOf(_selectedItemA);
                                firstshow2 = items2.indexOf(_selectedItemB);
                              });
                              break;
                            } else {}
                          }
                          setState(() {
                            competitionitems1 = _competitionitemsA;
                            _classitems1 = _classitemsA;
                          });
                          firstshow4 =
                              competitionitems.indexOf(_competitionitemsA);
                          setState(() {
                            if (date == 1) {
                              _dateitems1 = dateitems[1];
                              _dateitemsA = dateitems[1];
                            } else if (date == 2) {
                              _dateitems1 = dateitems[2];
                              _dateitemsA = dateitems[2];
                            } else if (date == 3) {
                              _dateitems1 = dateitems[3];
                              _dateitemsA = dateitems[3];
                            } else {
                              _dateitems1 = dateitems[0];
                              _dateitemsA = dateitems[0];
                            }
                            firstshow3 = dateitems.indexOf(_dateitemsA);
                          });
                          search();
                          Navigator.pop(context);
                        },
                        child: const Text('現在時刻で検索する',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


