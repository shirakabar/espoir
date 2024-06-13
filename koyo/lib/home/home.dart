import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:koyo/pdfview.dart';
import 'package:koyo/widget.dart';
import 'package:koyo/loginprovider.dart';
import 'package:url_launcher/url_launcher.dart';
//ほおむ

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _Home();
}

class _Home extends ConsumerState<Home> {
  int _current = 0;

  Widget homebutton({required String label,required void Function() onpressed,required IconData icon}) {
    return OutlinedButton(
        onPressed: onpressed,
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: const BorderSide(color: Colors.transparent),
            //fixedSize: const Size(double.infinity, 50)
            ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Future _init(WidgetRef ref) async {
    //init login data
    LoginDataManager.setLoginDataProviderDataFromLocal(ref);
  }
  @override
  Widget build(BuildContext context) {
    _init(ref);
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
                        Color.fromARGB(255, 245, 245, 245),
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
                          img: 'assets/images/symbol.jpg',
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
                              const Duration(seconds: 8), //カードのインターバル
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
                        '体育祭は6月17日‼',
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均等に横に並べる
                  children: [ 
                    homebutton(label: '''　 結果  　''',onpressed: () => context.push('/result'),icon:  Icons.emoji_events),
                    homebutton(label: '''ホームページ'''/*'''　 整理券 　'''*/,onpressed: () {
                      final url = Uri.parse(
                              'https://www.nagoya-c.ed.jp/school/koyo-h/index.html');
                          launchUrl(url);
                    },icon: Icons.receipt),
                    homebutton(label: '''アンケート''',onpressed: () {
                      final url = Uri.parse(
                              'https://docs.google.com/forms/d/e/1FAIpQLSenWU97munsKfYxjUQZ5Giws7LJux-6CCJxvGlmazFfSErfBA/viewform?usp=sf_link');
                          launchUrl(url);
                    },icon: Icons.description),
                  ]),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均等に横に並べる
                  children: [
                    
                    homebutton(label: '''アカウント''',onpressed: () => context.push('/account'),icon: Icons.account_circle), //outlinedbuttonのクラス
                    homebutton(label: '''お問い合わせ''',
                    onpressed: () {
                          final url = Uri.parse(
                              'https://forms.office.com/Pages/ResponsePage.aspx?id=DQSIkWdsW0yxEjajBLZtrQAAAAAAAAAAAAN__kqOgrtUOTlOV0lDVFZZSktRTDNGTUJGODYzODRENy4u');
                          launchUrl(url);
                        },
                        icon: Icons.support_agent),
                    homebutton(label: '''　 要項 　''',
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(
                                    pdf: 'assets/docs/sportsprogram.pdf',
                                    title: '体育祭実施要項')),
                          );
                        },
                        icon: Icons.article),
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
                height: 200,
                child: ListView(
                    itemExtent: 350, //横幅
                    scrollDirection: Axis.horizontal, //横スクロール
                    padding: const EdgeInsets.only(left: 5),
                    children: [
                      Menucard(
                          title: 'アクセス',
                          img: 'assets/images/access.png',
                          ontap: () {
                            final url = Uri.parse(
                              'https://www.nagoya-c.ed.jp/school/koyo-h/index.html');
                          launchUrl(url);
                          },),
                      Menucard(
                          title: '中学生へ',
                          img: 'assets/images/koyobuilding.jpg',
                          ontap: () {
                            final url = Uri.parse(
                              'https://www.nagoya-c.ed.jp/school/koyo-h/d_juken.html');
                          launchUrl(url);
                          },),
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
                          context.push('/adminselect');
                        },
                      ),
                    /*if (ref.watch(currentLoginStatusProvider) !=
                        CurrentLoginStatus.notLoggedIn)
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),*/
                      if (ref.watch(currentLoginStatusProvider) ==
                        CurrentLoginStatus.loggedInStaff)
                      ListTile(
                        title: const Text('スタッフ用'),
                        onTap: () {
                          context.push('/staffselect');
                        },
                      ),
                      /*if (ref.watch(currentLoginStatusProvider) ==
                        CurrentLoginStatus.loggedInStaff)
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
                      ),*/
                    const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text('法的事項'),
                      onTap: () {
                        context.push('/policyselect');
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
