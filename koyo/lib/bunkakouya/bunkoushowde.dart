import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koyo/widget/videoplayer.dart';
import 'package:koyo/settings/loginprovider.dart';
import 'package:koyo/widget/widget.dart';

class Bunkoushowde extends StatelessWidget {
  final String title;
  final String place;
  final String detail;
  final String number;
  //文化祭、後夜祭の発表詳細画面

  const Bunkoushowde(
      {super.key,
      required this.title,
      required this.place,
      required this.detail,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: '発表詳細'),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      number,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ))
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('@$place', style: const TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20),
                Text(detail, style: const TextStyle(fontSize: 18)),
              ]),
        ));
  }
}

class Ondemandde extends ConsumerWidget {
  final String title;
  final String detail;
  final String number;
  final String videourl;
  final String songname;
  //文化祭、後夜祭のオンデマンド発表詳細画面

  const Ondemandde(
      {super.key,
      required this.title,
      required this.detail,
      required this.number,
      required this.videourl,
      required this.songname});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: const Bar(title: '発表詳細'),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      number,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 30),
                    ))
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(songname, style: const TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('@オンデマンド\n(生徒のみご覧いただけます)',
                      style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20),
                Text(detail, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                if (ref.watch(currentLoginStatusProvider) !=
                    CurrentLoginStatus.notLoggedIn)
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Videoplayer(
                                    title: 'オンデマンド再生', videourl: videourl)));
                      },
                      child: Image.asset('assets/images/movieplay.png',
                          height: 100)),
                if (ref.watch(currentLoginStatusProvider) !=
                    CurrentLoginStatus.notLoggedIn)
                  const Text('※タップで再生します', style: TextStyle(fontSize: 18)),
              ]),
        ));
  }
}
