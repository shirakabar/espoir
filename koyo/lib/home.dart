import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
//ほおむ

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
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
                  /*Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Container(
                      decoration: (BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      )),
                      width: double.infinity, //横無限
                      height: 300, //機種によってはオーバーフローするっぽい
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/esupo.png',
                              fit: BoxFit.fitHeight) //エスポワールの画像
                        ],
                      )),
                ),*/
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
              size: Size.square(5.0),
              activeSize: Size.square(5.0),
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
                    Button(label: '要項', rout: '/come', icon: Icons.article),
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
                          ); /*Card(
                color: Colors.white,
                elevation: 5,//影
                margin: const EdgeInsets.symmetric(horizontal: 5), 
                shape: const RoundedRectangleBorder(
            //side: BorderSide(color: Colors.grey),
           borderRadius: BorderRadius.all(Radius.circular(20))//角はとろう
          ),
              child: ListTile(
                title: const Text('試験アナウンス',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                //subtitle: const Text('あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよわをん'),
                //tileColor: Colors.white,
                onTap: () {
                  context.push('/$index');
                },
                tileColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
            )
              
                );*/
                        }),
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

class Button extends StatelessWidget {
  //outlinedbuttonのクラスを作成し、使いまわす
  const Button(
      {required this.label, required this.rout, required this.icon, super.key});
  final String label;
  final String rout;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          context.push(rout);
        },
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: const BorderSide(color: Colors.transparent),
            fixedSize: const Size(135, 50)),
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
}

class CarouselContainerbox extends StatelessWidget{
  const CarouselContainerbox({required this.img,required this.title,super.key});

  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      child: Container(
      width: double.infinity, //横無限
      height: 210,
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        )),
      child: Container(
      width: double.infinity, //横無限
      height: 210,
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(150, 0, 0, 0),
                    ],
                    stops: [
                      0.7,
                      1,
                    ],
                  ), 
        ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:15),
        child: Align(alignment: Alignment.bottomLeft,
                   child: Text(title,style: const TextStyle(color:Colors.white,fontSize: 23,fontWeight: FontWeight.bold))
      )
      )
        ),
    ),
        );
  }
}
