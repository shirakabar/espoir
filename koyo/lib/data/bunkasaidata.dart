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
   const Bunkasaidata(time: '10:00', title: '合唱部', place: '@体育館'),
   const Bunkasaidata(time: '10:00', title: '演劇部', place: '@大講義室'),
   const Bunkasaidata(time: '10:50', title: 'ジャズオーケストラ部', place: '@体育館'),
   const Bunkasaidata(time: '11:40', title: '管弦楽部', place: '@体育館'),
   const Bunkasaidata(time: '12:45', title: 'フォークソング部', place: '@体育館'),
  ];
}