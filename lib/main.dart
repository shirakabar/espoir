import 'package:flutter/material.dart';//必須
import 'package:koyo/router.dart';//ページ遷移指定用
import 'package:koyo/home/home.dart';//アプリのホーム画面
import 'package:koyo/sports festival/sports.dart';//体育祭ページ
import 'package:koyo/hakurankai/hakuran.dart';//博覧会ぺーじ
import 'package:koyo/bunkakouya/bunkou.dart';//文化祭、後夜祭ページ
import 'package:koyo/map/map.dart';//校舎内マップページ
import 'package:firebase_core/firebase_core.dart';//firebase連携で必須
import 'firebase_options.dart';//同じくfirebase
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//メインの関数、ここからすべては始まる

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//firebaseを使うための定型文
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,       
  );
  runApp(const ProviderScope(child: MyApp()));
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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '博覧会'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '文化・後夜'),
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

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({required this.title,super.key});
  final String title;

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    title:  Text(title,style: const TextStyle(color: Colors.white),),
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white),
    actions: [IconButton(
                icon: const Icon(Icons.notifications),

                onPressed: () {
                  context.push('/news');
                },
    ),],
  );
}
}


class Draw extends StatelessWidget{
  const Draw({super.key});
  
  @override
  Widget build(BuildContext context) {

  return Drawer(child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               SizedBox(
                    height: 80,
                    child:Image.asset('images/koyoicon.jpg',fit: BoxFit.fitHeight,),
                ),
                const SizedBox(
            height: 5,
          ),
                 const Text('第76回向陽祭',style: TextStyle(fontSize: 20,color: Colors.white),),
              ]
              )
            ),
            ),
            const Tile(label: "結果", rout: '/come', icon: Icons.emoji_events),
            const Tile(label: "整理券", rout: '/come', icon: Icons.receipt),
            const Tile(label: "アンケート", rout: '/come', icon: Icons.description),
            const Tile(label: "アカウント", rout: '/come', icon: Icons.account_circle),
            const Tile(label: "お問い合わせ", rout: '/come', icon: Icons.support_agent),
            const Tile(label: "要項", rout: '/come', icon: Icons.article),
            const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text('利用規約'),
                      onTap: () {
                        context.push('/come');
                      },
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
          ],
        ),

  );

  
  }
}

class Tile extends StatelessWidget{
  const Tile({super.key,required this.label,required this.rout,required this.icon});
  final String label;
  final String rout;
  final IconData ?icon;

  @override
 Widget build(BuildContext context){
 return ListTile(
              title: Text(label),
              leading: Icon(icon),
              onTap: (){
                context.push(rout);
              },
            );
 }
}
