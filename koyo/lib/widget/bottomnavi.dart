import 'package:flutter/material.dart';//必須
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koyo/hakurankai/hakuran.dart';
import 'package:koyo/home/home.dart';//アプリのホーム画面
import 'package:koyo/sportsfestival/sports.dart';//体育祭ページ
import 'package:koyo/bunkakouya/bunkou.dart';//文化祭、後夜祭ページ
import 'package:koyo/map/map.dart';//校舎内マップページ
import 'package:koyo/settings/koyo_icons.dart';//文化祭、後夜祭ページ

final bottomnaviProvider = NotifierProvider<BottomNaviNotifier, int>(BottomNaviNotifier.new);

class BottomNaviNotifier extends Notifier<int> {//riverpod2.0のproviderをクラスで定義
  @override
  int build() {
    return 0;
  }

  void setindex(int index) {
    state = index;
  }
}

class Bottomnavi extends ConsumerStatefulWidget {//statefulなやつ
  const Bottomnavi({super.key});

  @override
  ConsumerState<Bottomnavi> createState() => _Bottomnavi();
}

class _Bottomnavi extends ConsumerState<Bottomnavi> {//statefulWidgetを受け継いだstate
  static const _screens = [//各画面を格納
    Home(),//ホーム画面
    Sports(),//スポーツ関係
    Hakuran(),//博覧会
    Bunkou(),//文化・後夜
    Map()//校内マップ
  ];
  
  void tap(int index) => setState(() => ref.watch(bottomnaviProvider.notifier).setindex(index));//bottomnavigationbarタップ時の処理

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(//bottomnavigationbarのみため
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),     
          BottomNavigationBarItem(icon: Icon(Icons.sports_tennis), label: '体育祭'), 
          BottomNavigationBarItem(icon: Icon(Koyo.hakurankaiicon), label: '博覧会'),
          BottomNavigationBarItem(icon: Icon(Koyo.kouyasaiicon), label: '文化・後夜'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'マップ'),
        ],
        currentIndex: ref.watch(bottomnaviProvider),
        fixedColor: Theme.of(context).primaryColor,
        onTap: tap,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),

      body: _screens[ref.watch(bottomnaviProvider)]//_screensリストのref.watch(bottomnaviProvider)番目を取り出し
    );
  }
}