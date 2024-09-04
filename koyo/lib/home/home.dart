import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:koyo/home/commentwidget.dart';
import 'package:koyo/settings/koyo_icons.dart';
import 'package:koyo/widget/bottomnavi.dart';
import 'package:koyo/widget/pdfview.dart';
import 'package:koyo/widget/widget.dart';
import 'package:koyo/settings/loginprovider.dart';
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
  
  @override
  void initState() {
    LoginDataManager.setLoginDataProviderDataFromLocal(ref);
    super.initState();
  }

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
                      items: [
                        CarouselContainerbox(
                          title: '向陽祭',
                          img: 'assets/images/symbol.jpg',
                          ontap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(
                                    pdf: 'assets/docs/gakkousainogoannai.pdf',
                                    title: 'ご案内')),
                          );
                          },
                        ),
                        CarouselContainerbox(
                          title: '体育祭',
                          img: 'assets/images/taiikusai.jpg',
                          ontap: () => ref.watch(bottomnaviProvider.notifier).setindex(1),
                        ),
                        CarouselContainerbox(
                          title: '文化祭',
                          img: 'assets/images/bunkasai.jpg',
                          ontap: () => ref.watch(bottomnaviProvider.notifier).setindex(3),
                        ),
                        CarouselContainerbox(
                          title: '博覧会',
                          img: 'assets/images/hakuran.jpg',
                          ontap: () => ref.watch(bottomnaviProvider.notifier).setindex(2),
                        ),
                        CarouselContainerbox(
                          title: '後夜祭',
                          img: 'assets/images/kouya.jpg',
                          ontap: () => ref.watch(bottomnaviProvider.notifier).setindex(3),
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
                    const Commentwidget(),
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
                    Expanded(child: homebutton(label: '結果',onpressed: () => context.push('/result'),icon:  Icons.emoji_events), ),
                    
                    Expanded(child: homebutton(label: '整理券',onpressed: () => context.push('/ticketlist'),icon: Koyo.ticketicon),),

                    (ref.watch(currentLoginStatusProvider) != CurrentLoginStatus.notLoggedIn) ? 
                    Expanded(child: homebutton(label: '生徒投票',onpressed: () {
                     final url = Uri.parse(
                              'https://forms.office.com/Pages/ResponsePage.aspx?id=3meRRyNrWEOYBlpq_Yo7xPbWF0D1-uhNlY5oT1WmOxpUMTlUTFUxTFVDRDRGQkZDUU83Q0JHTFpCVS4u');
                          launchUrl(url);
                    },icon: Icons.description),) : 

                    Expanded(child: homebutton(label: '来場者投票',onpressed: () {
                     final url = Uri.parse(
                              'https://forms.office.com/Pages/ResponsePage.aspx?id=3meRRyNrWEOYBlpq_Yo7xPbWF0D1-uhNlY5oT1WmOxpURFZDSkFGVk9SRjBCS1FHSE4zM0hBVjhGTi4u');
                          launchUrl(url);
                    },icon: Icons.description),)         

                  ]),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均等に横に並べる
                  children: [
                    
                    Expanded(child: homebutton(label: 'アカウント',onpressed: () => context.push('/account'),icon: Icons.account_circle)), //outlinedbuttonのクラス
                    Expanded(child: homebutton(label: 'お問い合わせ',
                    onpressed: () {
                          final url = Uri.parse(
                              'https://forms.office.com/Pages/ResponsePage.aspx?id=DQSIkWdsW0yxEjajBLZtrQAAAAAAAAAAAAN__kqOgrtUOTlOV0lDVFZZSktRTDNGTUJGODYzODRENy4u');
                          launchUrl(url);
                        },
                        icon: Icons.support_agent)),
                    (ref.watch(currentLoginStatusProvider) != CurrentLoginStatus.notLoggedIn) ? 
                    Expanded(child: homebutton(label: '注意事項',
                        onpressed: () {
                         context.push('/pdfselect');
                        },
                        icon: Icons.article)) : 
                    Expanded(child: homebutton(label: 'ホームページ',
                        onpressed: () {
                            final url = Uri.parse(
                              'https://www.nagoya-c.ed.jp/school/koyo-h/');
                          launchUrl(url);
                          },
                        icon: Icons.open_in_new)),
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
                      if (ref.watch(currentLoginStatusProvider) == CurrentLoginStatus.loggedInAdmin)
                      Menucard(title: '管理者用', img: 'assets/images/symbol.jpg', ontap: () => context.push('/adminselect')),
                      if (ref.watch(currentLoginStatusProvider) == CurrentLoginStatus.loggedInStaff)
                      Menucard(title: 'スタッフ用', img: 'assets/images/symbol.jpg', ontap: () => context.push('/staffselect')),
                      if (ref.watch(currentLoginStatusProvider) != CurrentLoginStatus.notLoggedIn && !ref.watch(loggedInClassProvider).startsWith('3'))
                      Menucard(title: 'クラス運営', img: 'assets/images/symbol.jpg', ontap: () => context.push('/classmanage')),
                      
                      Menucard(
                          title: 'ご案内',
                          img: 'assets/images/koyobuilding.jpg',
                          ontap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(
                                    pdf: 'assets/docs/gakkousainogoannai.pdf',
                                    title: 'ご案内')),
                          );
                          },),
                      Menucard(
                          title: 'アクセス',
                          img: 'assets/images/access.png',
                          ontap: () {
                            final url = Uri.parse(
                              'https://www.nagoya-c.ed.jp/school/koyo-h/1_access.html');
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
