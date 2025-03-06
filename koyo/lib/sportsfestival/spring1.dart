import 'package:flutter/material.dart';
import 'package:koyo/data/springbasicdata.dart';
//スプリングのスケジュール一覧仮画面

class Spring1 extends StatefulWidget {
  const Spring1({super.key});

  @override
  State<Spring1> createState() => _Spring1();
}

class _Spring1 extends State<Spring1> {
  List<Springdatas> sportsList = [];

  void getSpringdata(String classname, int day) {//クラス、日時を決めてリストを作る関数
    List<Springdatas> presportsList = [];
    for (var value in Sports.values) {
      SpringSportsdata? predata = Springbasicdatas().getspringsportsdata(value);
      debugPrint(value.toString());
      //SpringSportsdata(name: 'バドミントン', place: 'Aコート', matchList: badmintonDansi_1, day: 1);などを取得
      if (predata!.day == day) {
        //求める日付であるか
        String sportsname = predata.name;
        String place = predata.place;
        int day = predata.day;
        List<Springdatas> prematchList = predata.matchList;//[Springdatas(classes: ['101','102'], time: 1230),Springdatas(classes: ['103','104'], time: 1330)];などを取得
      for (var springdata in prematchList) {
        if (springdata.classes.contains(classname)) {
          springdata.sportsname = sportsname; //クラスが当てはまったらスポーツ名と場所と日時を入れる
          springdata.day = day;
          springdata.place == null ? springdata.place = place : null;//もし場所が指定済み（例外的な場所）の場合代入しない
          presportsList.add(springdata);
        }
      }
      } 
      }
    presportsList.sort((a, b) => a.time.compareTo(b.time));//開始時間で並び替え
    sportsList = presportsList;//sportsListに完成を格納
  }

  @override
  void initState() {
    getSpringdata('101', 1);//実際に使用する際はウィジェットで変更
    super.initState();
  }

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
                     const Padding(
                          padding: EdgeInsets.only(left: 20, top: 15),
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
                                 Text(
                                  '仮画面',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 35),
                                ),
                                 SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '仮画面',
                                  style: TextStyle(fontSize: 18),
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
                          //スプリングの各種目を一覧表示
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: sportsList.length,
                          itemBuilder: (BuildContext context, int index) {

                            String sportstime = sportsList[index].time.toString();
                            String sportstimestr = '${sportstime.substring(0, 2)}:${sportstime.substring(2, 4)}';

                            String classes = '${sportsList[index].classes[0]} vs ${sportsList[index].classes[1]}';
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
                                      leading: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                        '${sportsList[index].day}日目',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                          Text(
                                        sportstimestr,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                         
                                      ],),
                                      title: Text(
                                        classes,
                                        style: const TextStyle(fontSize: 21),
                                      ),
                                      subtitle: Text('${sportsList[index].sportsname} ${sportsList[index].place}'),
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
