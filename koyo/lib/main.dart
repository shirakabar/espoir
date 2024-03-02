import 'package:flutter/material.dart';//必須
import 'package:koyo/router.dart';//ページ遷移指定用
import 'package:koyo/home.dart';//アプリのホーム画面
import 'package:koyo/sports.dart';//体育祭ページ
import 'package:koyo/hakuran.dart';//博覧会ぺーじ
import 'package:koyo/bunkou.dart';//文化祭、後夜祭ページ
import 'package:koyo/map.dart';//校舎内マップページ
import 'package:firebase_core/firebase_core.dart';//firebase連携で必須
import 'firebase_options.dart';//同じくfirebase

//メインの関数、ここからすべては始まる

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//firebaseを使うための定型文
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,       
  );
  runApp(const MyApp());
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
          secondary:  (Colors.white), 
          onSecondary:  (Colors.black), 
          error:   (Color.fromARGB(255, 25, 118, 210)), 
          onError:  (Colors.white), 
          background:  (Colors.white), //grey50
          onBackground: (Colors.white), 
          surface: (Color.fromARGB(255, 241, 249, 255)), 
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
    Sports(),//体育祭
    Hakuran(),//博覧会
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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '博覧会'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '文化・後夜'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'マップ'),
        ],//labelがみえないのなぜ
        currentIndex: _currentindex,
        fixedColor: Colors.blueAccent,
        onTap: tap,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle:const TextStyle(color: Colors.grey)
      ),

      body: _screens[_currentindex],//_screensリストの_currentindex番目を取り出し
      
    );
  }
}

