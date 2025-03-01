library springdata;
import 'package:koyo/sportsfestival/spring.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<String> items1 = [
  '指定なし',
  '13:00',
  '13:10',
  '13:20',
  '13:30',
  '13:40',
  '13:50',
  '14:00',
  '14:10',
  '14:20',
  '14:30',
  '14:40',
  '14:50',
  '15:00',
  '15:10',
  '15:20',
  '15:30',
  '終了',
];

final List<String> items2 = [
  '指定なし',
  '13:00',
  '13:10',
  '13:20',
  '13:30',
  '13:40',
  '13:50',
  '14:00',
  '14:10',
  '14:20',
  '14:30',
  '14:40',
  '14:50',
  '15:00',
  '15:10',
  '15:20',
  '15:30',
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
  '男子バレー',
  '女子バレー',
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

}

class Springdatafire {
  final String time;
  final String team1;
  final String team2;
  final String competition;
  final String date;
  final String matchplace;
  DateTime? notificationTimes;

  Springdatafire({
    required this.time,
    required this.team1,
    required this.team2,
    required this.competition,
    required this.date,
    required this.matchplace,
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
          transaction.set(counterRef, {'matchId': newMatchId});  // 初期カウンター値をセット
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
        };

        // 新しいドキュメントを追加（IDをmatchIdに設定）
        transaction.set(firestore.collection('springdata').doc(matchId), matchData);

        // カウンターを更新
        transaction.update(counterRef, {'matchId': newMatchId});
      });

      // Firestoreに保存した後に新しいmatchIdを出力
    // ignore: empty_catches
    } catch (e) {
    }
  }
}
class Springdatafiredata {
  List<Springdata> springdatafiredata = [

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
        // notificationTimes: springdata.notificationTimes,
      );

      // saveToFirestore メソッドを呼び出す
      await springdatafire.saveToFirestore();
    }
  }
}