import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/data/localdata.dart';

class FirstOverBoard extends StatefulWidget {
  const FirstOverBoard({super.key});

  @override
  FirstOverBoardState createState() => FirstOverBoardState();
}

class FirstOverBoardState extends State<FirstOverBoard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Future<void> finishoverboard() async {
      LocalData.saveLocalData('firstoverboard', true);
      context.go('/');
    }

    final pages = [
    PageModel.withChild(
        color: const Color.fromARGB(255, 241, 249, 255), //背景の色
        doAnimateChild: true,//アニメーションの有無
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/images/tutorial_home.png',width: double.infinity),),
            const Text('向陽祭アプリへようこそ！',style: TextStyle(fontSize: 25,),textAlign: TextAlign.center,)
        ],
        ),
        ), 
    ),
    PageModel.withChild(
        color: const Color.fromARGB(255, 241, 249, 255), //背景の色
        doAnimateChild: true,//アニメーションの有無
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/images/tutorial_list.png',width: double.infinity),),
            const Text('向陽祭一覧',style: TextStyle(fontSize: 25,)),
            const Text('発表一覧、混雑度を確認！',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,)
        ],
        ),
        ), 
    ),
    PageModel.withChild(
        color: const Color.fromARGB(255, 241, 249, 255), //背景の色
        doAnimateChild: true,//アニメーションの有無
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/images/tutorial_map.png',width: double.infinity),),
            const Text('マップ',style: TextStyle(fontSize: 25,),textAlign: TextAlign.center,),
            const Text('クラスをタップで詳細を確認！',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,)
        ],
        ),
        ), 
    ),
    PageModel.withChild(
        color: const Color.fromARGB(255, 241, 249, 255), //背景の色
        doAnimateChild: true,//アニメーションの有無
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/images/tutorial_ticketget.png',width: double.infinity),),
            const Text('整理券',style: TextStyle(fontSize: 25,),textAlign: TextAlign.center,),
            const Text('QRコードを読み取って簡単取得！',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,)
        ],
        ),
        ), 
    ),
    PageModel.withChild(
        color: const Color.fromARGB(255, 241, 249, 255), //背景の色
        doAnimateChild: true,//アニメーションの有無
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/images/tutorial_home.png',width: double.infinity),),
            const Text('機能',style: TextStyle(fontSize: 25,),textAlign: TextAlign.center,),
            const Text('整理券、結果、投票などの機能はホーム画面のボタンから！',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,)
        ],
        ),
        ), 
    ),
  ];
    return SafeArea(child: Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipText: 'スキップ',
        nextText: '次へ',
        finishText: '終了',
        activeBulletColor: Theme.of(context).primaryColor,
        inactiveBulletColor: Colors.grey,
        buttonColor: Theme.of(context).primaryColor,
        skipCallback: () {
          finishoverboard();
        },
        finishCallback: () {
          finishoverboard();
        },
      ),
    )
    );
  }
}