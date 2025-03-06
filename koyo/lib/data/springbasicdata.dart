//スプリングフェアの基本的なデータ

import 'package:koyo/data/springdata1.dart';

//各試合詳細
class Springdatas {
  Springdatas({required this.classes, required this.time, this.place, this.sportsname, this.day});

  final List<String> classes;
  final int time;
  String? place;
  String? sportsname;
  int? day;
}

//各スポーツ詳細
class SpringSportsdata {
  const SpringSportsdata(
      {required this.name,
      required this.place,
      required this.matchList,
      required this.day});

  final String name;
  final String place;
  final List<Springdatas> matchList;
  final int day;
}

//スポーツ一覧を列挙型に格納
enum Sports {
  badmintonDansi_1,
  badmintonDansi_2,
  //badmintonDansi_3,
  badmintonJosi_1,
  badmintonJosi_2,
  //badmintonJosi_3,
  
  volleyA_1,
  volleyB_1,
  volleyC_1,
  volleyD_1,
  volleyA_2,
  volleyB_2,
  volleyC_2,
  volleyD_2,
  //soccer,
  //tabletennis,
  //molkky
}

//スポーツが呼び出されたらそのデータを返す
class Springbasicdatas {

  SpringSportsdata? getspringsportsdata(sports) {
    switch (sports) {
      case Sports.badmintonDansi_1:
        return SpringSportsdata(name: 'バドミントン男子', place: 'Aコート', matchList: SpringBadminton().badmintonDansi_1, day: 1);
      case Sports.badmintonDansi_2:
        return SpringSportsdata(name: 'バドミントン男子', place: 'Aコート', matchList: SpringBadminton().badmintonDansi_2, day: 2);
      case Sports.badmintonJosi_1:
        return SpringSportsdata(name: 'バドミントン女子', place: 'Bコート', matchList: SpringBadminton().badmintonJosi_1, day: 1);
      case Sports.badmintonJosi_2:
        return SpringSportsdata(name: 'バドミントン女子', place: 'Bコート', matchList: SpringBadminton().badmintonJosi_2, day: 2);
      case Sports.volleyA_1:
        return SpringSportsdata(name: 'バレー男子', place: 'Aコート', matchList: SpringVolley().volleyA_1, day: 1);
      case Sports.volleyB_1:
        return SpringSportsdata(name: 'バレー男子', place: 'Bコート', matchList: SpringVolley().volleyB_1, day: 1);
      case Sports.volleyC_1:
        return SpringSportsdata(name: 'バレー女子', place: 'Cコート', matchList: SpringVolley().volleyC_1, day: 1);
      case Sports.volleyD_1:
        return SpringSportsdata(name: 'バレー女子', place: 'Dコート', matchList: SpringVolley().volleyD_2, day: 1);
      case Sports.volleyA_2:
        return SpringSportsdata(name: 'バレー男子', place: 'Aコート', matchList: SpringVolley().volleyA_2, day: 2);
      case Sports.volleyB_2:
        return SpringSportsdata(name: 'バレー男子', place: 'Bコート', matchList: SpringVolley().volleyB_2, day: 2);
      case Sports.volleyC_2:
        return SpringSportsdata(name: 'バレー女子', place: 'Cコート', matchList: SpringVolley().volleyC_2, day: 2);
      case Sports.volleyD_2:
        return SpringSportsdata(name: 'バレー女子', place: 'Dコート', matchList: SpringVolley().volleyD_2, day: 2);

      default:
        return null;
    }
  }
}
