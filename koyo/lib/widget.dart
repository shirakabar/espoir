import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({required this.title, super.key});
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            context.push('/news');
          },
        ),
      ],
    );
  }
}

class Draw extends StatelessWidget {
  const Draw({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5), 
                            child: Image.asset(
                              'assets/images/koyoicon.png',
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '第76回向陽祭',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ])),
          ),
          const Tile(label: "結果", rout: '/come', icon: Icons.emoji_events),
          const Tile(label: "整理券", rout: '/come', icon: Icons.receipt),
          const Tile(label: "アンケート", rout: '/come', icon: Icons.description),
          const Tile(label: "アカウント", rout: '/come', icon: Icons.account_circle),
          const Tile(label: "お問い合わせ", rout: '/come', icon: Icons.support_agent),
          const Tile(label: "要項", rout: '/come', icon: Icons.article),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(children: [
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
              ]))
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile(
      {super.key, required this.label, required this.rout, required this.icon});
  final String label;
  final String rout;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      leading: Icon(icon),
      onTap: () {
        context.push(rout);
      },
    );
  }
}

class CarouselContainerbox extends StatelessWidget {
  const CarouselContainerbox(
      {required this.img, required this.title, super.key});

  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold))))),
      ),
    );
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

class Menucard extends StatelessWidget {
  const Menucard(
      {required this.title, required this.img, required this.rout, super.key});
  final String title;
  final String img;
  final String rout;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.push('/come');
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: double.infinity, //横無限
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                )),
            child: Container(
                width: double.infinity, //横無限
                height: 150,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold))))),
          ),
        ));
  }
}

/*
Card(
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
                                        img,
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
                                  child: Text(
                                    title,
                                    style: const TextStyle(
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
*/