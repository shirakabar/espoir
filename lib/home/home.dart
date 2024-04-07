import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:koyo/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//ほおむ

final user = FirebaseAuth.instance.currentUser;
final isLoggedInAdminProvider = StreamProvider.autoDispose((_) {
  CollectionReference ref = FirebaseFirestore.instance.collection('Admins');
  return ref.snapshots().map((snapshot) {
    final list = snapshot.docs.toList();
    return list;
  });
});
class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _Home();
}
class _Home extends ConsumerState<Home>{
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Draw(),
        appBar: const Bar(title: '第76回向陽祭'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 370,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.white,
                      Color(0xFFEEEEEE),
                    ],
                    stops: [
                      0.5,
                      1.0,
                    ],
                  ),
                ),
                child: Column(children: [
                const SizedBox(
                height: 10,
              ),
                CarouselSlider(
            items: const [
               CarouselContainerbox(title: '向陽祭',img: 'images/esupo.png',),
               CarouselContainerbox(title: '体育祭',img: 'images/taiikusai.jpg',),
               CarouselContainerbox(title: '文化祭',img: 'images/bunkasai.jpg',),
               CarouselContainerbox(title: '博覧会',img: 'images/hakuran.jpg',),
               CarouselContainerbox(title: '後夜祭',img: 'images/kouya.jpg',),
            ],

            options: CarouselOptions(
              height: 250, //高さ
              initialPage: 0, //最初に表示されるページ
              autoPlay: true,//自動でスライドしてくれるか
              viewportFraction: 0.95,//各カードの表示される範囲の割合
              enableInfiniteScroll: true,//最後のカードから最初のカードへの遷移
              autoPlayInterval: const Duration(seconds: 15),//カードのインターバル
              autoPlayAnimationDuration: const Duration(milliseconds: 400),
                                            //スライドが始まって終わるまでの時間
              onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
            ),
          ),
          const SizedBox(
                height: 5,
              ),
          DotsIndicator(
             dotsCount: 5,
             position: _current,
             decorator: const DotsDecorator(
              size: Size.square(6.0),
              activeSize: Size.square(6.0),
              )
             ),
          const SizedBox(
                height: 9,
              ),
          Container(
          width: 350,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).primaryColor,
          ),
          child: const Text('なんかかきたい',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)
          ),
          const SizedBox(
                height: 10,
              ),
                ]
                )
             ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均等に横に並べる
                  children: [
                    Button(label: '結果', rout: '/result', icon: Icons.emoji_events),
                    Button(label: '整理券', rout: '/ticket', icon: Icons.receipt),
                    Button(label: 'アンケート',rout: '/crowd',icon: Icons.description),
                  ]),
              const SizedBox(
                height: 20,
              ),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均等に横に並べる
                  children: [
                    Button(label: 'アカウント',rout: '/account',icon: Icons.account_circle), //outlinedbuttonのクラス
                    Button(label: 'お問い合わせ', rout: '/login', icon: Icons.support_agent),
                    Button(label: '要項', rout: '/newsmake', icon: Icons.article),
                  ]),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('メニュー',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                    height: 230,
                    child: ListView.builder(
                        itemExtent: 300, //横幅
                        scrollDirection: Axis.horizontal, //横スクロール
                        itemCount: 3, //仮
                        padding: const EdgeInsets.only(left:5),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            //ネットからのデザイン
                            elevation: 4,
                            margin: const EdgeInsets.all(5),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            clipBehavior:
                                Clip.antiAliasWithSaveLayer, // 画像を丸角にする
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 150,
                                      child: Image.asset(
                                        'images/kouya.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                // タイトル
                                Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 8),
                                  child: const Text(
                                    '後夜祭',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                // 説明文
                                Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.only(left:8,bottom: 2),
                                  child: const Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(children: [
                    if (ref.watch(isLoggedInAdminProvider) == user!.uid)
                     const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    if (ref.watch(isLoggedInAdminProvider) == user!.uid)
                    ListTile(
                      title: const Text('管理者用'),
                      onTap: () {
                        context.push('/come');
                      },
                    ),
                    const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text('利用規約'),
                      onTap: () {
                        context.push('/crowd');
                      },
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ]))
            ],
          ),
        ));
  }
}


