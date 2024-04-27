class Taiikusaidata {
  const Taiikusaidata({
    required this.time,
    required this.title,
    required this.place,
    required this.pdf,
  });

  final String time;
  final String title;
  final String place;
  final String pdf;
}

class TaiikusaidataList {
  List<Taiikusaidata> taiikusaidata = [
    const Taiikusaidata(time: '09:20', title: '開会式', place: '@クラス席', pdf: ''),
    const Taiikusaidata(time: '09:20', title: '開会式', place: '@クラス席', pdf: ''),
    const Taiikusaidata(time: '09:20', title: '開会式', place: '@クラス席', pdf: ''),
    const Taiikusaidata(time: '09:20', title: '開会式', place: '@クラス席', pdf: ''),
    const Taiikusaidata(time: '09:20', title: '開会式', place: '@クラス席', pdf: ''),
    const Taiikusaidata(time: '09:20', title: '開会式', place: '@クラス席', pdf: ''),
    const Taiikusaidata(time: '09:20', title: '開会式', place: '@クラス席', pdf: ''),
    const Taiikusaidata(time: '09:20', title: '開会式', place: '@クラス席', pdf: ''),
  ];
}