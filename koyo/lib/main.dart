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
//なかしょー誕生日おめでとう！アプリ製作お疲れ様ヾ(｡・ω・)ﾉﾟ