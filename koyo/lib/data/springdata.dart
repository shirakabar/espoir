library springdata;
import 'package:koyo/sportsfestival/spring.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<String> items1 = [
  '指定なし',
  '0:01',
  '0:20',
  '9:00',
  '9:30',
  '10:00',
  '10:30',
  '11:00',
  '11:30',
  '12:00',
  '12:30',
  '13:00',
  '13:30',
  '14:00',
  '14:30',
  '15:00',
  '終了',
];

final List<String> items2 = [
  '指定なし',
  '0:01',
  '0:20',
  '9:00',
  '9:30',
  '10:00',
  '10:30',
  '11:00',
  '11:30',
  '12:00',
  '12:30',
  '13:00',
  '13:30',
  '14:00',
  '14:30',
  '15:00',
  '終了',
];

final List<String> dateitems = [
  '指定なし',
  '１日目',
  '２日目',
  '３日目',
];

final List<String> classesitems = [
  '指定なし',
  '101',
  '102',
  '103',
  '104',
  '105',
  '106',
  '107',
  '108',
  '109',
  '201',
  '202',
  '203',
  '204',
  '205',
  '206',
  '207',
  '208',
  '209',
];
final List<String> competitionitems = [
  '指定なし',
  'サッカー',
  '卓球',
  '男子バドミントン',
  '女子バドミントン',
  '男子バレーボール',
  '女子バレーボール',
  'モルック',
];
final List<int> notificationdaylist = [
  5,
  7,
  10,
  11,
  12,
];
List<DateTime> notificationSelect = [DateTime(2030, 1, 1, 17, 59)];

class SpringdataListfirst {
  List<Springdata> springdatafirst = [
  ];


}

  // Springdata(
  //   time: '09:00',
  //   team1: '101',
  //   team2: '102',
  //   competition: 'サッカー',
  //   date: '１日目',
  //   matchplace: '体育館A',
  //   result: '',
  //   notificationTimes: DateTime(2025, 1, 6, 21, 25),
  // ),


Future<void> clearCollection(String collectionPath) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // コレクション内のすべてのドキュメントを取得
  QuerySnapshot snapshot = await firestore.collection(collectionPath).get();

  // ドキュメントを削除
  for (var doc in snapshot.docs) {
    await doc.reference.delete();
  }

  print('Collection $collectionPath has been cleared.');
}

class Springdatafire {
  final String time;
  final String team1;
  final String team2;
  final String competition;
  final String date;
  final String matchplace;
  final String result;
  DateTime? notificationTimes;

  Springdatafire({
    required this.time,
    required this.team1,
    required this.team2,
    required this.competition,
    required this.date,
    required this.matchplace,
    required this.result,
    this.notificationTimes,
  });
  

  // Firestoreに保存するメソッド
  Future<void> saveToFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // 連番ID用の変数
    int newMatchId = 0;

    try {
      // トランザクションを開始
      await firestore.runTransaction((transaction) async {
        // カウンター用のドキュメントを参照
        DocumentReference counterRef = firestore.collection('counters').doc('matchCounter');
        
        // 現在のカウンターの値を取得
        DocumentSnapshot counterSnapshot = await transaction.get(counterRef);
        
        if (counterSnapshot.exists) {
          // 既存のカウンターがあれば、その値を使ってインクリメント
          newMatchId = counterSnapshot['matchId'] + 1;
        } else {
          // `matchCounter` ドキュメントが存在しない場合は初期値を設定
          newMatchId = 1;
          await transaction.set(counterRef, {'matchId': newMatchId});  // 初期カウンター値をセット
        }

        // 新しい試合のIDを決定
        String matchId = newMatchId.toString().padLeft(3, '0');  // 例: 001, 002, 003

        // 試合データをFirestoreに保存
        Map<String, dynamic> matchData = {
          'time': time,
          'team1': team1,
          'team2': team2,
          'competition': competition,
          'date': date,
          'matchplace': matchplace,
          'result': result,
          // 'notificationTimes': notificationTimes.toIso8601String(), 
        };

        // 新しいドキュメントを追加（IDをmatchIdに設定）
        await transaction.set(firestore.collection('springdata').doc(matchId), matchData);

        // カウンターを更新
        transaction.update(counterRef, {'matchId': newMatchId});
      });

      // Firestoreに保存した後に新しいmatchIdを出力
      print('Match data saved successfully with ID: ${newMatchId.toString().padLeft(3, '0')}');
    } catch (e) {
      print('Error saving match data: $e');
    }
  }
}
class Springdatafiredata {
  List<Springdata> springdatafiredata = [
Springdata(
   time: '13:49',
   team1: '203',
   team2: '204',
   competition: 'バドミントン',
   date: '１日目',
   matchplace: '体育館A',
   result: '',
  ),

  ];
  Future<void> updatedata() async {
    // springdatafiredataがList<Springdata>型なので、forループで回せる
    for (var springdata in springdatafiredata) {
      // Springdatafire インスタンスを作成
      Springdatafire springdatafire = Springdatafire(
        time: springdata.time,
        team1: springdata.team1,
        team2: springdata.team2,
        competition: springdata.competition,
        date: springdata.date,
        matchplace: springdata.matchplace,
        result: springdata.result,
        // notificationTimes: springdata.notificationTimes,
      );

      // saveToFirestore メソッドを呼び出す
      await springdatafire.saveToFirestore();
    }
  }
}