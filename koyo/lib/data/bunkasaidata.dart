//文化祭のデータリスト

class Bunkasaidata {
  const Bunkasaidata({
    required this.time,
    required this.title,
    required this.place,
    //required this.detail,
  });

  final String time;
  final String title;
  final String place;
  //final String detail;
}

class BunkasaidataList {
  List<Bunkasaidata> bunkasaidata = [
    const Bunkasaidata(time: '10:00～10:35', title: '管弦楽部', place: '体育館'),
    const Bunkasaidata(time: '10:00～12:00', title: '演劇部', place: '大講義室'),
    const Bunkasaidata(time: '10:45～11:25', title: '合唱部', place: '体育館'),
    const Bunkasaidata(time: '11:35～12:25', title: 'ジャズオーケストラ部', place: '体育館'),
    const Bunkasaidata(time: '12:55～14:55', title: '軽音部', place: '体育館'),
    const Bunkasaidata(time: '13:00～15:00', title: '演劇部', place: '大講義室'),
  ];
}

class Hannichidata {
  const Hannichidata({
    required this.time,
    required this.title,
    required this.place,
    //required this.detail,
  });

  final String time;
  final String title;
  final String place;
  //final String detail;
}

class HannichidataList {
  List<Hannichidata> hannichidata = [
    const Hannichidata(time: '午前', title: 'レジン作り', place: '地学室'),
    const Hannichidata(time: '午前', title: '麻雀大会', place: '多目的３'),
    const Hannichidata(
        time: '午前', title: '数学グラフ描写アプリ「Desmos」を使ってアートゲームを作ろう', place: '化学講義室'),
    const Hannichidata(time: '午前', title: '向陽クイズ王決定戦', place: '多目的４'),
    const Hannichidata(time: '午前', title: 'オリジナルクレープを作ろう', place: '美術室'),
    const Hannichidata(time: '午前', title: 'ホッケー体験教室', place: 'グラウンド'),
    const Hannichidata(time: '午前', title: '雀荘こうよう～ざわざわ～', place: '多目的２'),
    const Hannichidata(
        time: '午前', title: 'ビーズストラップでＴ２ファージやDNAを作ろう！！ ', place: '生物実験室'),
    const Hannichidata(time: '午後', title: '麻雀大会', place: '多目的３'),
    const Hannichidata(
        time: '午後', title: '数学グラフ描写アプリ「Desmos」を使ってアートゲームを作ろう', place: '化学講義室'),
    const Hannichidata(time: '午後', title: '向陽クイズ王決定戦', place: '多目的４'),
    const Hannichidata(
        time: '午後', title: '解の公式及び階乗の分かりやすい解説講座 ', place: '多目的２'),
    const Hannichidata(
        time: '午後', title: '科学部の水ロケット講座', place: '生物実験室からグラウンド '),
    const Hannichidata(time: '午後', title: 'シュシュ作り', place: '家庭科実習室'),
    const Hannichidata(time: '午後', title: 'バスボムづくり', place: '地学室'),
    const Hannichidata(time: '随時', title: 'コウヨウトレジャーハンター（予約不要）', place: '多目的１'),
  ];
}
