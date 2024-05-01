import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:koyo/pdfview.dart';
import 'package:koyo/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:koyo/loginprovider.dart';
import 'package:url_launcher/url_launcher.dart';
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

class _Home extends ConsumerState<Home> {
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
                  height: 365,
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
                        CarouselContainerbox(
                          title: '向陽祭',
                          img: 'assets/images/esupo.png',
                        ),
                        CarouselContainerbox(
                          title: '体育祭',
                          img: 'assets/images/taiikusai.jpg',
                        ),
                        CarouselContainerbox(
                          title: '文化祭',
                          img: 'assets/images/bunkasai.jpg',
                        ),
                        CarouselContainerbox(
                          title: '博覧会',
                          img: 'assets/images/hakuran.jpg',
                        ),
                        CarouselContainerbox(
                          title: '後夜祭',
                          img: 'assets/images/kouya.jpg',
                        ),
                      ],
                      options: CarouselOptions(
                          height: 250, //高さ
                          initialPage: 0, //最初に表示されるページ
                          autoPlay: true, //自動でスライドしてくれるか
                          viewportFraction: 0.95, //各カードの表示される範囲の割合
                          enableInfiniteScroll: true, //最後のカードから最初のカードへの遷移
                          autoPlayInterval:
                              const Duration(seconds: 15), //カードのインターバル
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 400),
                          //スライドが始まって終わるまでの時間
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
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
                        )),
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
                      child: const Center(
                          child: Text(
                        'テスト画面です！！',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ])),
              const SizedBox(
                height: 40,
              ),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均等に横に並べる
                  children: [
                    Button(
                        label: '結果', rout: '/result', icon: Icons.emoji_events),
                    Button(label: '整理券', rout: '/ticket', icon: Icons.receipt),
                    Button(
                        label: 'アンケート',
                        rout: '/crowd',
                        icon: Icons.description),
                  ]),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均等に横に並べる
                  children: [
                    const Button(
                        label: 'アカウント',
                        rout: '/account',
                        icon: Icons.account_circle), //outlinedbuttonのクラス
                    OutlinedButton(
                        //お問い合わせじゃなかったら別のところに追いやってね
                        onPressed: () {
                          final url = Uri.parse(
                              'https://forms.office.com/Pages/ResponsePage.aspx?id=DQSIkWdsW0yxEjajBLZtrQAAAAAAAAAAAAN__kqOgrtUOTlOV0lDVFZZSktRTDNGTUJGODYzODRENy4u');
                          launchUrl(url);
                          context.push('/');
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(color: Colors.transparent),
                            fixedSize: const Size(135, 50)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.support_agent,
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text(
                              'お問い合わせ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    //const Button(label: 'お問い合わせ', rout: '/login', icon: Icons.support_agent),
                    //const Button(label: '要項', rout: '/pdfview', icon: Icons.article),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(pdf: 'assets/docs/sportsprogram.pdf', title: '体育祭実施要項')),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(color: Colors.transparent),
                            fixedSize: const Size(135, 50)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.article,
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text(
                              '要項',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
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
                height: 8,
              ),
              SizedBox(
                height: 180,
                child: ListView(
                    itemExtent: 300, //横幅
                    scrollDirection: Axis.horizontal, //横スクロール
                    padding: const EdgeInsets.only(left: 5),
                    children: const [
                      Menucard(
                          title: 'アクセス',
                          img: 'assets/images/access.png',
                          rout: '/come'),
                      Menucard(
                          title: '中学生へ',
                          img: 'assets/images/koyobuilding.jpg',
                          rout: '/come'),
                    ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(children: [
                    if (ref.watch(currentLoginStatusProvider) ==
                        CurrentLoginStatus.loggedInAdmin)
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    if (ref.watch(currentLoginStatusProvider) ==
                        CurrentLoginStatus.loggedInAdmin)
                      ListTile(
                        title: const Text('管理者用'),
                        onTap: () {
                          context.push('/come');
                        },
                      ),
                    if (ref.watch(currentLoginStatusProvider) !=
                        CurrentLoginStatus.notLoggedIn)
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    if (ref.watch(currentLoginStatusProvider) !=
                        CurrentLoginStatus.notLoggedIn)
                      ListTile(
                        title: const Text('クラス運営'),
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
                        context.push('/newsmake');
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
