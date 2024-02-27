import 'package:flutter/material.dart';
import 'package:koyo/router.dart';
import 'package:koyo/home.dart';
import 'package:koyo/sports.dart';
import 'package:koyo/hakuran.dart';
import 'package:koyo/bunkou.dart';
import 'package:koyo/map.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

//メインの関数、ここからすべては始まる

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,       
  );
  runApp(const MyApp());
}                          

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      
      title: '第７６回向陽祭',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light, 
          primary: (Color.fromARGB(255, 25, 118, 210)), 
          onPrimary:  (Colors.white), 
          secondary:  (Colors.white), 
          onSecondary:  (Colors.black), 
          error:   (Color.fromARGB(255, 25, 118, 210)), 
          onError:  (Colors.black), 
          background:  (Color.fromARGB(255, 245, 245, 245)), //grey
          onBackground: (Colors.white), 
          surface: (Color.fromARGB(255, 25, 118, 210)), 
          onSurface: (Colors.black),),
        useMaterial3: true,
      ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();

  
}

class _MyHomePageState extends State<MyHomePage> {
   int _currentindex =0;
  static const _screens = [
    Home(),
    Sports(),
    Hakuran(),
    Bunkou(),//文化と後夜でございます
    Map()
  ];
  

  void tap(int index) => setState(() => _currentindex = index );

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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

      body: _screens[_currentindex],
      
    );
  }
}

