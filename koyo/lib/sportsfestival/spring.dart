import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:koyo/data/basicdata.dart';
import 'package:koyo/data/springdata.dart';
import 'package:koyo/sportsfestival/springnotifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:koyo/sportsfestival/springstate.dart';
//スプリングフェアのスケジュール一覧

class Spring extends StatefulWidget {
  const Spring({super.key});

  @override
  State<Spring> createState() => _Spring();
}

class _Spring extends State<Spring> {
  List<int> dayDataList = [];
  List<Color> springDataIconColor = [];
  List<Color> springDataIconStyle = [];
  List<int> springDataResult = [];
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
  int mainindex = 0;
  int day1 = 0;
  int day2 = 0;
  int day3 = 0;
  int notificationday = 0;
  int notificationhour = 0;
  int notificationminute= 0;
  int change = 0; 
  int prechange = 0; 
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
  Future<void> makeNotifications(mainindex) async {
  if (_springdata[mainindex].date == '１日目') {
    notificationday = notificationdaylist[dayDataList[0]];
  } else if (_springdata[mainindex].date == '２日目') {
    notificationday = notificationdaylist[dayDataList[1]];
  } else if (_springdata[mainindex].date == '３日目') {
    notificationday = notificationdaylist[dayDataList[2]];
  }
  List<String> timeParts = _springdata[mainindex].time.split(':');
  // 分割した部分を整数に変換
  notificationhour = int.parse(timeParts[0]);
  notificationminute = int.parse(timeParts[1]);
  setState(() {
  notificationhour = int.parse(timeParts[0]);
  notificationminute = int.parse(timeParts[1]);
  if (notificationminute < 5) {
    // 分が5未満なら1時間減らし、分は60から引く
    notificationhour = (notificationhour - 1) % 24;  // 24時間制なので、負の値になる場合に対応
    notificationminute = 60 + notificationminute - 5;
  } else {
    // 5分以上なら単純に5分を引く
    notificationminute -= 5;
  }

  });
  }


  Future<List<Map<String, dynamic>>> readSpringdata() async {
    getData();
    getresultData();
    final snapshot = await _db
        .collection('springdata')
        .get();

    // ドキュメントデータをリストに格納
    return snapshot.docs
        .map((doc) => doc.data())
        .toList();
  }
Future<void> getData() async {
  dayDataList.clear();
  try {
    // コレクション全体を取得
    QuerySnapshot snapshot = await _firestore.collection('spring').get();
    // ドキュメントが存在する場合に処理
    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // 必要なフィールドをint型に変換してリストに格納
        if (data.containsKey('daydata') && data['daydata'] is num) {
          dayDataList.add((data['daydata'] as num).toInt());  // doubleをintに変換してリストに追加
        }
        else if (data.containsKey('new') && data['new'] is String) {
          change = int.tryParse(data['new'])!;
          // 変換後の値は変数changeに格納される
        }
      }
    } else {
      throw 'No documents found in the collection';
    }
  } catch (e) {
    throw 'Error retrieving data: $e';
  }
}
Future<void> getresultData() async {
  springDataResult.clear();  // リストを初期化
  try {
    // コレクション全体を取得
    QuerySnapshot snapshot = await _firestore.collection('springresult').get();

    // ドキュメントが存在する場合に処理
    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // フィールド名でソートするために、Map をエントリのリストに変換して並べ替え
        var sortedEntries = data.entries.toList()
          ..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key)));  // フィールド名を数値としてソート

        // 並び替えた結果をリストに追加
        for (var entry in sortedEntries) {
          if (entry.value is num) {
            springDataResult.add(entry.value.toInt());
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
    _loadData(); 
    _loadPrechangeValue();
  }

  // prechangeの値を保存する
  Future<void> _savePrechangeValue(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('prechange', value); // 'prechange' キーで保存
  }

  // ローカルストレージからprechangeの値を読み込む
  Future<void> _loadPrechangeValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prechange = prefs.getInt('prechange') ?? 0; // 保存された値を取得、なければ0をデフォルト値に
    });
  }
  // SharedPreferencesからspringDataIconColorデータを読み込む
  Future<void> _loadData() async {
    List<Color> colors = await DataStorage.loadData();
    setState(() {
      springDataIconColor = colors;
    });
  }


// springDataIconColorリストの長さ分だけ赤色を追加
void _addItem() {
  if (springDataIconColor.isEmpty || springDataIconColor.length != springdataList.springLength) {
    springDataIconColor.clear();

      // springDataIconColorリストの長さ分だけ赤色を追加
      for (int i = 0; i < springdataList.springLength; i++) {
        springDataIconColor.add(const Color(0xfff44336));  // 赤色を追加
      }



  }
}
  void _toggleIconColor(int index) {
    setState(() {
      // 現在の色を確認し、赤→緑、緑→赤に切り替える
      if (springDataIconColor[index] == const Color(0xfff44336)) {
        springDataIconColor[index] = const Color(0xff4caf50);
      } else if (springDataIconColor[index] == const Color(0xff4caf50)) {
        springDataIconColor[index] = const Color(0xfff44336);
      }
    });
    DataStorage.saveData(springDataIconColor);  // 変更後にデータを保存

  }
  void _toggleIconStyle(int index) {
    setState(() {
      // 現在の色を確認し、赤→緑、緑→赤に切り替える
      if (springDataIconColor[index] == const Color(0xfff44336)) {
        _springdata[index].iconstyle = Icons.alarm_off;
      } else if (springDataIconColor[index] == const Color(0xff4caf50)) {
        _springdata[index].iconstyle = Icons.alarm_on;
      }
    });
  }

  void _addIconStyle() {
      for (int i = 0; i < springdataList.springLength; i++) {
        if (springDataIconColor[i] == const Color(0xfff44336)) {
        _springdata[i].iconstyle = Icons.alarm_off;
        } else if (springDataIconColor[i] == const Color(0xff4caf50)) {
        _springdata[i].iconstyle = Icons.alarm_on;
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (change != prechange) {
                showNotificationChangedDialog(context);
                prechange = change;
                _savePrechangeValue(prechange);
                notificationSelect.clear();
                notificationSelect.add(DateTime(2030, 1, 1, 17, 59));
                springDataIconColor.clear();
                setState(() {
                  for (int i = 0; i < springdataList.springLength; i++) {
                    springDataIconColor.add(const Color(0xfff44336));  // 赤色を追加
                  }                  
                });
                _addIconStyle();
              }
            });
                _addItem();
                _addIconStyle();

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
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'スプリングフェア',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 35),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            springdate,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ],
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
                              itemBuilder: (BuildContext context, mainindex) {
                                if (searchitem.contains(mainindex)) {
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
                                                      _springdata[mainindex].date,
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  Text(
                                                    _springdata[mainindex].time,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    '@${_springdata[mainindex].matchplace}',
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
                                                        Text.rich(TextSpan(
                                                            text: _springdata[mainindex].team1,
                                                            style:
                                                             TextStyle(
                                                              fontSize: 22,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              color: springDataResult[mainindex] == 1 ? Colors.blue : const Color.fromARGB(255, 0, 0, 0),
                                                            ),
                                                            children: <TextSpan>[
                                                              const TextSpan(
                                                                text:
                                                                    ' VS ',
                                                                style:
                                                                    TextStyle(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  fontSize: 22,
                                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    _springdata[mainindex].team2,
                                                                style:
                                                                    TextStyle(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  fontSize: 22,
                                                                  color: springDataResult[mainindex] == 2 ? Colors.blue : const Color.fromARGB(255, 0, 0, 0),
                                                                ),
                                                              ),
                                                            ]) as InlineSpan),
                                                        // Row(
                                                        //   children: [
                                                        Text(
                                                          _springdata[mainindex]
                                                              .competition,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16),
                                                        ),

                                                        //   ],
                                                        // ),
                                                      ]),
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    _springdata[mainindex]
                                                        .iconstyle,
                                                    size: 24,
                                                    color: springDataIconColor[mainindex],
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                        _springdata[mainindex]
                                                                .iconstyle =
                                                            (_springdata[mainindex]
                                                                        .iconstyle ==
                                                                    Icons
                                                                        .alarm_off)
                                                                ? Icons.alarm_on
                                                                : Icons.alarm_off;
                                                      
                                                      makeNotifications(mainindex);
                                                        if (notificationSelect
                                                            .contains(DateTime(2025, 3, notificationday, notificationhour, notificationminute))) {
                                                          // 存在する場合、その日時をリストから削除
                                                          notificationSelect
                                                              .remove(DateTime(2025, 3, notificationday, notificationhour, notificationminute));
                                                        } else {
                                                          // 存在しない場合、その日時をリストに追加
                                                          notificationSelect.add(DateTime(2025, 3, notificationday, notificationhour, notificationminute));
                                                        }
                                                        _toggleIconColor(mainindex);
                                                        _toggleIconStyle(mainindex);
                                                    });
                                                    scheduleNotifications();
                                                  },
                                                  padding: EdgeInsets.zero,
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

  void showNotificationChangedDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('最新情報に更新されました'),
          content: const Text('設定した通知が初期化されましたので変更し直してください。'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // ダイアログを閉じる
              },
            ),
          ],
        );
      },
    );
} 
}



class Springdata {
  Springdata({
    required this.time,
    required this.team1,
    required this.team2,
    required this.competition,
    required this.date,
    required this.matchplace,
    this.iconstyle = Icons.alarm_off,  // デフォルトのアイコン
    this.notificationTimes,
  });

  final String time;
  final String team1;
  final String team2;
  final String competition;
  final String date;
  final String matchplace;
  late IconData iconstyle;
  DateTime? notificationTimes; 

  factory Springdata.fromMap(Map<String, dynamic> map) {
    return Springdata(
      time: map['time'] ?? '',
      team1: map['team1'] ?? '',
      team2: map['team2'] ?? '',
      competition: map['competition'] ?? '',
      date: map['date'] ?? '',
      matchplace: map['matchplace'] ?? '',
    );
  }
}


class SpringdataList {
  // 初期のspringdataリスト
  List<Springdata> springdata = [
 Springdata(
   time: '13:10',
   team1: '102',
   team2: '107',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
  ),
 Springdata(
   time: '13:10',
   team1: '106',
   team2: '108',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
  ),
 Springdata(
   time: '13:23',
   team1: '101',
   team2: '103',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
 ),
 Springdata(
   time: '13:23',
   team1: '103',
   team2: '104',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
 ),
Springdata(
   time: '13:36',
   team1: '201A',
   team2: '205',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
),
Springdata(
   time: '13:36',
   team1: '201',
   team2: '206',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
),
Springdata(
   time: '13:49',
   team1: '203',
   team2: '204',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
),
Springdata(
   time: '13:49',
   team1: '101',
   team2: '102',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
),
Springdata(
   time: '14:02',
   team1: '104',
   team2: '106',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
),
Springdata(
   time: '14:02',
   team1: '202',
   team2: '204',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
),
Springdata(
   time: '14:15',
   team1: '107',
   team2: '109',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
),
Springdata(
   time: '14:15',
   team1: '108',
   team2: '109',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
),
Springdata(
   time: '14:28',
   team1: '207',
   team2: '208',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
),
Springdata(
   time: '14:28',
   team1: '203',
   team2: '205',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
),
Springdata(
   time: '14:41',
   team1: '201B',
   team2: '202',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
),
Springdata(
   time: '14:41',
   team1: '206',
   team2: '209',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
),
Springdata(
   time: '14:54',
   team1: '103',
   team2: '105',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
  ),
Springdata(
   time: '14:54',
   team1: '104',
   team2: '107',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
),
Springdata(
   time: '15:07',
   team1: '106',
   team2: '108',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
),
Springdata(
   time: '15:07',
   team1: '102',
   team2: '105',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館B',
),


Springdata(
   time: '13:10',
   team1: '107',
   team2: '108',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスA',
),
Springdata(
   time: '13:10',
   team1: '206',
   team2: '207',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスB',
),
Springdata(
   time: '13:10',
   team1: '108',
   team2: '102',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスC',
),
Springdata(
   time: '13:10',
   team1: '204',
   team2: '208',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスD',
),
Springdata(
   time: '13:35',
   team1: '102',
   team2: '105',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスA',
),
Springdata(
   time: '13:35',
   team1: '202',
   team2: '205',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスB',
),
Springdata(
   time: '13:35',
   team1: '109',
   team2: '104',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスC',
),
Springdata(
   time: '13:35',
   team1: '201',
   team2: '202',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスD',
),
Springdata(
   time: '14:00',
   team1: '101B',
   team2: '104',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスA',
),
Springdata(
   time: '14:00',
   team1: '201',
   team2: '204',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスB',
),
Springdata(
   time: '14:00',
   team1: '106',
   team2: '107',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスC',
),
Springdata(
   time: '14:00',
   team1: '203',
   team2: '205',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスD',
),
Springdata(
   time: '14:25',
   team1: '103',
   team2: '106',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスA',
),
Springdata(
   time: '14:25',
   team1: '205',
   team2: '209',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスB',
),
Springdata(
   time: '14:25',
   team1: '103',
   team2: '105',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスC',
),
Springdata(
   time: '14:25',
   team1: '208',
   team2: '209',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスD',
),
Springdata(
   time: '14:50',
   team1: '105',
   team2: '109',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスA',
),
Springdata(
   time: '14:50',
   team1: '204',
   team2: '208',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスB',
),
Springdata(
   time: '14:50',
   team1: '108',
   team2: '101B',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスC',
),
Springdata(
   time: '14:50',
   team1: '202',
   team2: '206',
   competition: 'バレー',
   date: '１日目',
   matchplace: 'テニスD',
),


Springdata(
   time: '13:10',
   team1: '101',
   team2: '106',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドA',
),
Springdata(
   time: '13:10',
   team1: '201',
   team2: '206',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドB',
),
Springdata(
   time: '13:35',
   team1: '102',
   team2: '105',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドA',
),
Springdata(
   time: '13:35',
   team1: '204',
   team2: '205',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドB',
),
Springdata(
   time: '14:00',
   team1: '103',
   team2: '104',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドA',
),
Springdata(
   time: '14:00',
   team1: '202',
   team2: '203',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドB',
),
Springdata(
   time: '14:25',
   team1: '106',
   team2: '107',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドA',
),
Springdata(
   time: '14:25',
   team1: '206',
   team2: '207',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドB',
),
Springdata(
   time: '14:50',
   team1: '108',
   team2: '103',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドA',
),
Springdata(
   time: '14:50',
   team1: '205',
   team2: '208',
   competition: 'サッカー',
   date: '１日目',
   matchplace: 'グラウンドB',
),


Springdata(
   time: '13:10',
   team1: '109',
   team2: '101',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場A',
),
Springdata(
   time: '13:10',
   team1: '209',
   team2: '204',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場B',
),
Springdata(
   time: '13:35',
   team1: '104',
   team2: '105',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場A',
),
Springdata(
   time: '13:35',
   team1: '202',
   team2: '203',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場B',
),
Springdata(
   time: '14:00',
   team1: '106',
   team2: '108',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場A',
),
Springdata(
   time: '14:00',
   team1: '205',
   team2: '208',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場B',
),
Springdata(
   time: '14:25',
   team1: '101',
   team2: '102',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場A',
),
Springdata(
   time: '14:25',
   team1: '206',
   team2: '207',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場B',
),
Springdata(
   time: '14:50',
   team1: '105',
   team2: '107',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場A',
),
Springdata(
   time: '14:50',
   team1: '208',
   team2: '209',
   competition: '卓球',
   date: '１日目',
   matchplace: '格技場B',
),


Springdata(
   time: '13:10',
   team1: '109',
   team2: '204',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックA',
),
Springdata(
   time: '13:10',
   team1: '107',
   team2: '102',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックB',
),
Springdata(
   time: '13:10',
   team1: '108',
   team2: '101',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックC',
),
Springdata(
   time: '13:10',
   team1: '教員1',
   team2: '105',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックD',
),
Springdata(
   time: '13:35',
   team1: '104',
   team2: '教員2',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックA',
),
Springdata(
   time: '13:35',
   team1: '208',
   team2: '202',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックB',
),
Springdata(
   time: '13:35',
   team1: '207',
   team2: '203',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックC',
),
Springdata(
   time: '13:35',
   team1: '106',
   team2: '205',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックD',
),
Springdata(
   time: '14:00',
   team1: '109',
   team2: '206',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックA',
),
Springdata(
   time: '14:00',
   team1: '107',
   team2: '201',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックB',
),
Springdata(
   time: '14:00',
   team1: '108',
   team2: '103',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックC',
),
Springdata(
   time: '14:00',
   team1: '教員1',
   team2: '209',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックD',
),
Springdata(
   time: '14:25',
   team1: '204',
   team2: '104',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックA',
),
Springdata(
   time: '14:25',
   team1: '102',
   team2: '208',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックB',
),
Springdata(
   time: '14:25',
   team1: '101',
   team2: '207',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックC',
),
Springdata(
   time: '14:25',
   team1: '105',
   team2: '106',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックD',
),
Springdata(
   time: '14:50',
   team1: '教員2',
   team2: '206',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックA',
),
Springdata(
   time: '14:50',
   team1: '202',
   team2: '201',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックB',
),
Springdata(
   time: '14:50',
   team1: '203',
   team2: '103',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックC',
),
Springdata(
   time: '14:50',
   team1: '205',
   team2: '209',
   competition: 'モルック',
   date: '１日目',
   matchplace: 'モルックD',
),

  ];

  dynamic springdatatemp = SpringdataListfirst().springdatafirst;


  void addData(List<Springdata> springdatafirestore) {
    springdata.clear();
    springdata.addAll(springdatatemp);
    springdata.addAll(springdatafirestore);
  }

  // springdata の長さを返すプロパティ
  int get springLength => springdata.length;


}
