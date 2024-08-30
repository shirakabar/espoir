class Gymdata {
  const Gymdata({
    required this.number,
    required this.title,
    required this.detail,
  });

  final String number;
  final String title;
  final String detail;
}

class GymdataList {
  List<Gymdata> gymdata = [
  const Gymdata(number: '1', title: '体育館テスト', detail: 'これはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストです'),
  ];
}

class Grounddata {
  const Grounddata({
    required this.number,
    required this.title,
    required this.detail,
  });

  final String number;
  final String title;
  final String detail;
}

class GrounddataList {
  List<Grounddata> grounddata = [
   const Grounddata(number: '1', title: 'グラウンドテスト', detail: 'これはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストですこれはテストです'),
  ];
}