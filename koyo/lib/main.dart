import 'package:flutter/material.dart';//必須
import 'package:koyo/settings/router.dart';//ページ遷移指定用
import 'package:koyo/settings/notificationsettings.dart';//通知設定
import 'package:firebase_core/firebase_core.dart';//firebase連携で必須
import 'settings/firebase_options.dart';//同じくfirebase
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';//端末情報の取得等

//メインの関数

void main() async {

  WidgetsFlutterBinding.ensureInitialized();//firebaseを使うための定型文
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,       
  );
  Notificationsettings.mainsettings();//通知設定

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);//ステータスバー
  SystemChrome.setPreferredOrientations([//縦向き固定
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
  runApp(const ProviderScope(child: MyApp()));});
}                          
class MyApp extends StatelessWidget {//アプリのいろんな設定
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,//gorouterを使うための定型文
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      
      title: '第７６回向陽祭',//アプリタイトル
      theme: ThemeData(
        colorScheme: const ColorScheme(//アプリの色設定
          brightness: Brightness.light, 
          primary: (Color.fromARGB(255, 25, 118, 210)), 
          onPrimary:  (Colors.white), 
          secondary:  (Color.fromARGB(255, 25, 118, 210)), 
          onSecondary:  (Colors.white), 
          error:   (Color.fromARGB(255, 25, 118, 210)), 
          onError:  (Colors.white), 
          surface: Colors.white,
          onSurface: (Colors.black),),
        useMaterial3: true,
      ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {//statefulなやつ
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  
}

class _MyHomePageState extends State<MyHomePage> {//statefulWidgetを受け継いだstate(必須)
   int _currentindex =0;//bottomnavigationbarの選択時の変数
  static const _screens = [//各画面を格納
    Home(),//ホーム画面
    Sports(),//体育祭]
    Kyo(),
    //Hakuran(),//博覧会
    Bunkou(),//文化と後夜でございます
    Map()//校内マップ
  ];
  

  void tap(int index) => setState(() => _currentindex = index );//bottomnavigationbarタップ時の処理

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
        currentIndex: _currentindex,
        fixedColor: Colors.blueAccent,
        onTap: tap,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),

      body: _screens[_currentindex],//_screensリストの_currentindex番目を取り出し
      
    );
  }
}
//なかしょー誕生日おめでとう！アプリ製作お疲れ様ヾ(｡・ω・)ﾉﾟ