
class Hakurankaidata {
  const Hakurankaidata({
   // required this.image,
    required this.classname,
    required this.title,
    required this.place,
    required this.detail,
  });

  //final String image;
  final String classname;
  final String title;
  final String place;
  final String detail;
}

class HakurankaidataList {
  List<Hakurankaidata> hakurankaidata = [
   const Hakurankaidata(title: '細胞よ、はたらけ', place: '中棟3階101教室', detail: 'この文章はテストですこの文章はテストですこの文章はテストですこの文章はテストですこの文章はテストですこの文章はテストですこの文章はテストですこの文章はテストですこの文章はテストですこの文章はテストですこの文章はテストですこの文章はテストですこの文章はテストです', classname: '101'),
  ];
}

class Clubdata {
  Clubdata({required this.title,required this.place,required this.club});
  final String title;
  final String place;
  final String club;
}

class ClubdataList {
  List<Clubdata> clubdata = [
    Clubdata(title: '美術部による展示の会', place: '美術室',club: '美術部'),
    Clubdata(title: '写真部2023', place: '多目的４',club: '写真部'),
    Clubdata(title: 'ちょっと一息しませんか?', place: 'ゼミ室',club: '茶道部'),
  ];
}

class Ichirandata {

  Ichirandata({required this.classname,required this.title, required this.detail});
  final String title;
  final String detail;
  final String classname;
}

class IchirandataList {
  List<Ichirandata> ichirandata = [
   Ichirandata(title: 'テスト', detail: 'これは一覧ですこれは一覧ですこれは一覧ですこれは一覧ですこれは一覧ですこれは一覧です', classname: '101'),
  ];
}

class Firstdata {
  Firstdata({required this.classname,required this.title,required this.time,required this.detail});
  final String title;
  final String time;
  final String detail;
  final String classname;
}

class FirstdataList {
  List<Firstdata> firstdata = [
   Firstdata(title: 'テスト', time: '10:00', detail: 'これは一日目ですこれは一日目ですこれは一日目ですこれは一日目ですこれは一日目ですこれは一日目です', classname: '101'),
  ];
}

class Seconddata {
  Seconddata({required this.classname,required this.title,required this.time,required this.detail});
  final String title;
  final String time;
  final String detail;
  final String classname;
}

class SeconddataList {
  List<Seconddata> seconddata = [
   Seconddata(title: 'テスト', time: '10:00', detail: 'これは二日目ですこれは二日目ですこれは二日目ですこれは二日目ですこれは二日目ですこれは二日目です', classname: '101'),
  ];
}