import 'package:flutter/material.dart';
import 'package:koyo/data/hakurandata.dart';
import 'package:koyo/hakurankai/hakuranclassde.dart';

//舞台の詳細
class Ichiran extends StatefulWidget {
  const Ichiran({super.key});

  @override
  State<Ichiran> createState() => _Ichiran();
}

class _Ichiran extends State<Ichiran> {
  final _ichirandata = IchirandataList().ichirandata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 10,
      ),
      const Center(
        child: Text(
          '発表一覧',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _ichirandata.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    //ここからを表示
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Text(
                            _ichirandata[index].classname,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                          title: Text(
                            _ichirandata[index].title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          tileColor: const Color.fromARGB(255, 241, 249, 255),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KyoDe(
                                      title: _ichirandata[index].title,
                                      place: '体育館',
                                      detail: _ichirandata[index].detail,
                                      classname:
                                          _ichirandata[index].classname)),
                            );
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )));
              }))
    ]));
  }
}

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _First();
}

class _First extends State<First> {
  final _firstdata = FirstdataList().firstdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 10,
      ),
      const Center(
        child: Text(
          'スケジュール',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _firstdata.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    //ここからを表示
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Text(
                            _firstdata[index].time,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                          title: Text(
                            _firstdata[index].title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          tileColor: const Color.fromARGB(255, 241, 249, 255),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KyoDe(
                                      title: _firstdata[index].title,
                                      place: '体育館',
                                      detail: _firstdata[index].detail,
                                      classname: _firstdata[index].classname)),
                            );
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )));
              }))
    ]));
  }
}

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _Second();
}

class _Second extends State<Second> {
  final _seconddata = SeconddataList().seconddata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 10,
      ),
      const Center(
        child: Text(
          'スケジュール',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _seconddata.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    //ここからを表示
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Text(
                            _seconddata[index].time,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                          title: Text(
                            _seconddata[index].title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          tileColor: const Color.fromARGB(255, 241, 249, 255),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KyoDe(
                                      title: _seconddata[index].title,
                                      place: '体育館',
                                      detail: _seconddata[index].detail,
                                      classname: _seconddata[index].classname)),
                            );
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )));
              }))
    ]));
  }
}
