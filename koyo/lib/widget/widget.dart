import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/data/basicdata.dart';
import 'package:koyo/settings/koyo_icons.dart';
import 'package:koyo/settings/loginprovider.dart';
import 'package:koyo/widget/bottomnavi.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//各種ウィジェット
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

class Draw extends ConsumerWidget {
  Draw({super.key});
  final fesname = BasicData().fesname;

  Widget tile(
      {required String label,
      required void Function() ontap,
      required IconData icon}) {
    return ListTile(title: Text(label), leading: Icon(icon), onTap: ontap);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
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
                    Text(
                      fesname,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ])),
          tile(
              label: "ホーム",
              ontap: () {
                Navigator.pop(context);
                ref.watch(bottomnaviProvider.notifier).setindex(0);
              },
              icon: Icons.home),
          tile(
              label: "結果",
              ontap: () => context.push('/result'),
              icon: Icons.emoji_events),
          tile(
              label: "整理券",
              ontap: () => context.push('/ticketlist'),
              icon: Koyo.ticketicon),
          (ref.watch(currentLoginStatusProvider) !=
                  CurrentLoginStatus.notLoggedIn)
              ? tile(
                  label: "生徒投票",
                  ontap: () {
                    final url = Uri.parse(
                        'https://forms.office.com/Pages/ResponsePage.aspx?id=3meRRyNrWEOYBlpq_Yo7xPbWF0D1-uhNlY5oT1WmOxpUMTlUTFUxTFVDRDRGQkZDUU83Q0JHTFpCVS4u');
                    launchUrl(url);
                  },
                  icon: Icons.description)
              : tile(
                  label: "来場者投票",
                  ontap: () {
                    final url = Uri.parse(
                        'https://forms.office.com/Pages/ResponsePage.aspx?id=3meRRyNrWEOYBlpq_Yo7xPbWF0D1-uhNlY5oT1WmOxpURFZDSkFGVk9SRjBCS1FHSE4zM0hBVjhGTi4u');
                    launchUrl(url);
                  },
                  icon: Icons.description),
          tile(
              label: "アカウント",
              ontap: () => context.push('/account'),
              icon: Icons.account_circle),
          tile(
              label: "お問い合わせ",
              ontap: () {
                final url = Uri.parse(
                    'https://forms.office.com/Pages/ResponsePage.aspx?id=DQSIkWdsW0yxEjajBLZtrQAAAAAAAAAAAAN__kqOgrtUOTlOV0lDVFZZSktRTDNGTUJGODYzODRENy4u');
                launchUrl(url);
                context.push('/');
              },
              icon: Icons.support_agent),
          (ref.watch(currentLoginStatusProvider) !=
                  CurrentLoginStatus.notLoggedIn)
              ? tile(
                  label: "要項",
                  ontap: () {
                    context.push('/pdfselect');
                  },
                  icon: Icons.article)
              : tile(
                  label: "ホームページ",
                  ontap: () {
                    final url =
                        Uri.parse('https://www.nagoya-c.ed.jp/school/koyo-h/');
                    launchUrl(url);
                  },
                  icon: Icons.open_in_new),
          Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const Divider(
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
    );
  }
}

class CarouselContainerbox extends StatelessWidget {
  const CarouselContainerbox(
      {required this.ontap, required this.img, required this.title, super.key});

  final String img;
  final String title;
  final dynamic ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Card(
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

class Menucard extends StatelessWidget {
  const Menucard(
      {required this.title, required this.img, required this.ontap, super.key});
  final String title;
  final String img;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                )),
            child: Container(
                width: 350,
                height: 200,
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
