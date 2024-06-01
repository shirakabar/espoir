class Taiikusaidata {
  const Taiikusaidata({
    required this.time,
    required this.title,
    required this.place,
    //required this.pdf,
  });

  final String time;
  final String title;
  final String place;
  //final String pdf;
}

class TaiikusaidataList {
  List<Taiikusaidata> taiikusaidata = [
    const Taiikusaidata(time: '09:00', title: '開会式', place: '@クラス席'),
    const Taiikusaidata(time: '09:20', title: '向陽リレー', place: 'ブロック対抗'),
    const Taiikusaidata(time: '10:25', title: '台風の目', place: 'ブロック対抗'),
    const Taiikusaidata(time: '11:05', title: '男女リレー(予選)', place: 'ブロック対抗'),
    const Taiikusaidata(time: '11:50', title: '玉入れ', place: 'ブロック対抗'),
    const Taiikusaidata(time: '12:25', title: '8の字ジャンプ', place: 'ブロック対抗'),
    const Taiikusaidata(time: '13:05', title: '十字綱引き', place: 'ブロック対抗'),
    const Taiikusaidata(time: '13:45', title: '男女リレー(決勝)', place: 'ブロック対抗'),
    const Taiikusaidata(time: '14:20', title: '部対抗リレー', place: '部活動対抗'),
    const Taiikusaidata(time: '14:45', title: '閉会式', place: '@クラス席'),
  ];
}