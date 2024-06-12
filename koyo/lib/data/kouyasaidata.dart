class Kouyasaidata {
  const Kouyasaidata({
    required this.number,
    required this.title,
    required this.type,
    //required this.detail,
  });

  final String number;
  final String title;
  final String type;
  //final String detail;
}

class KouyasaidataList {
  List<Kouyasaidata> kouyasaidata = [
   const Kouyasaidata(number: '1', title: 'バタスカ', type: 'お笑い'),
   const Kouyasaidata(number: '2', title: 'mignon', type: 'ダンス'),
   const Kouyasaidata(number: '3', title: 'VBS-f-th', type: 'ダンス'),
   const Kouyasaidata(number: '4', title: 'S-N-O-U-N', type: 'ダンス'),
  ];
}