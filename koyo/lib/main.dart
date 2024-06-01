//import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';//必須
import 'package:koyo/router.dart';//ページ遷移指定用
import 'package:koyo/home/home.dart';//アプリのホーム画面
import 'package:koyo/sports festival/sports.dart';//体育祭ページ
import 'package:koyo/hakurankai/hakuran.dart';//博覧会ぺーじ
import 'package:koyo/bunkakouya/bunkou.dart';//文化祭、後夜祭ページ
import 'package:koyo/map/map.dart';//校舎内マップページ
import 'package:firebase_core/firebase_core.dart';//firebase連携で必須
import 'settings/firebase_options.dart';//同じくfirebase
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:koyo/settings/koyo_icons.dart';//文化祭、後夜祭ページ
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'package:flutter/services.dart';

//メインの関数、ここからすべては始まる

void main() async {
  //FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  WidgetsFlutterBinding.ensureInitialized();//firebaseを使うための定型文
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,       
  );
  FirebaseMessaging.instance.subscribeToTopic('news');

  final messagingInstance = FirebaseMessaging.instance;
  messagingInstance.requestPermission();

   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  if (Platform.isIOS) {
    await messagingInstance.requestPermission();
    // iOSでフォアグランド通知を行うための設定
    await messagingInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  } else if (Platform.isAndroid) {
    final androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.createNotificationChannel(
      const AndroidNotificationChannel(
        'default_notification_channel',
        'プッシュ通知のチャンネル名',
        importance: Importance.max,
      ),
    );
    await androidImplementation?.requestNotificationsPermission();
  }

  // 通知設定の初期化を行う
  _initNotification();

  //final message = await FirebaseMessaging.instance.getInitialMessage();

  final fcmToken = await messagingInstance.getToken();
  debugPrint('FCM TOKEN: $fcmToken');


  SystemChrome.setPreferredOrientations([
    // 縦向き
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
  runApp(const ProviderScope(child: MyApp()));});
}                          

Future<void> _initNotification() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // バックグラウンド起動中に通知をタップした場合の処理
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    // フォアグラウンド起動中に通知が来た場合の処理

    // フォアグラウンド起動中に通知が来た場合、
    // Androidは通知が表示されないため、ローカル通知として表示する
    // https://firebase.flutter.dev/docs/messaging/notifications#application-in-foreground
    if (Platform.isAndroid) {
      // プッシュ通知をローカルから表示する
      await FlutterLocalNotificationsPlugin().show(
        0,
        notification!.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'default_notification_channel',
            'プッシュ通知のチャンネル名',
            importance: Importance.max, // 通知の重要度の設定
            icon: android?.smallIcon,
          ),
        ),
      );
    }
    
  });

  // ローカルから表示したプッシュ通知をタップした場合の処理を設定
  flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings(
          '@drawable/koyoicon'), 
      iOS: DarwinInitializationSettings(),
    ),
    /*onDidReceiveNotificationResponse: (details) {
      if (details.payload != null) {
        final payloadMap =
            json.decode(details.payload!) as Map<String, dynamic>;
        debugPrint(payloadMap.toString());
      }
    },*/
  );
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
          onSecondary:  (Colors.black), 
          error:   (Color.fromARGB(255, 25, 118, 210)), 
          onError:  (Colors.white), 
          background:  Color.fromARGB(255, 251, 251, 251), //grey50
          onBackground: (Colors.white), 
          surface: Color.fromARGB(255, 251, 251, 251),
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

