class Hakurankaidata {
  const Hakurankaidata({
   // required this.image,
    required this.title,
    required this.place,
    required this.detail,
  });

  //final String image;
  final String title;
  final String place;
  final String detail;
}

class HakurankaidataList {
  List<Hakurankaidata> hakurankaidata = [
   const Hakurankaidata(title: '細胞よ、はたらけ', place: '中棟3階101教室', detail: ''),
   const Hakurankaidata(title: '向陽詐欺してごめん', place: '中棟3階102教室', detail: ''),
   const Hakurankaidata(title: '一〇三で働かせてください。', place: '中棟3階103教室', detail: ''),
   const Hakurankaidata(title: '格付け 104ェック', place: '中棟3階104教室', detail: ''),
   const Hakurankaidata(title: 'ホグワーツ魔法魔術学校 105', place: '中棟3階105教室', detail: ''),
   const Hakurankaidata(title: 'ザ・スーパーコウムブラザーズ', place: '中棟3階106教室', detail: ''),
   const Hakurankaidata(title: 'あの金は何処へ ', place: '中棟3階107教室', detail: ''),
   const Hakurankaidata(title: '西蔵祭', place: '中棟4階108教室', detail: ''),
   const Hakurankaidata(title: '名探偵 109 赤孤島の殺人', place: '中棟4階109教室', detail: ''),   
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